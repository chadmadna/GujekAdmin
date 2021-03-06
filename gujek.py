# GUI for GujekAdmin

try:
    import Tkinter
    import tkFont
except ImportError:
    import tkinter as Tkinter
    import tkinter.font as tkFont

import tkinter.messagebox as mb
import tkinter.ttk as ttk
from gujekadmin import *

try:
    gujek = GujekAdmin('gujekadmin', 'gujek', 'localhost', 'admin1')
    table_list = gujek.get_table_names()
    table = 'employee'
    tree_columns = gujek.get_col_names(table)
    tree_data = gujek.show_table(table)
except psycopg2.OperationalError:
    print('Could not connect to PostgreSQL, please open the README.txt')

def sortby(tree, col, descending):
    """Sort tree contents when a column is clicked on."""
    # grab values to sort
    data = [(tree.set(child, col), child) for child in tree.get_children('')]

    # reorder data
    data.sort(reverse=descending)
    for indx, item in enumerate(data):
        tree.move(item[1], '', indx)

    # switch the heading so that it will sort in the opposite direction
    tree.heading(col,
        command=lambda col=col: sortby(tree, col, int(not descending)))

class App(Tkinter.Tk):
    def __init__(self):
        """ This class is used to display the tables from the database using python based programing.
            for this class to work, gujekadmin must first be imported """
        
        Tkinter.Tk.__init__(self)
        self.title("GuJek")
        self.wm_iconbitmap('image/favicon.ico')
        self.resizable(0,0)
        self.lift()
        self.tree = None
        self._setup_widgets()
        self._build_tree()
        self._setup_popup()
        self.bind("<Return>",self.search_data)

    def _setup_widgets(self):
        """ This method is used to setup the dropdown menus and the search setup """
        
        # Variables
        self.table_var = Tkinter.StringVar()
        self.table_var.set(table)
        self.column_var = Tkinter.StringVar()
        self.column_var.set(tree_columns[0])

        # Top panel
        self.top_panel = ttk.Frame(padding=(10,10,10,0))
        self.top_panel.pack(fill='both', expand=True, anchor="e")

        # Container
        self.container = ttk.Frame(padding=(10,10,10,10), width=800, height=600)
        self.container.pack(fill='both', expand=True)

        # Option menu for selecting table
        self.table_option = ttk.OptionMenu(self.top_panel, self.table_var, "employee", *table_list, command=self._set_table)
        self.table_option.grid(row=0, column=1, sticky="e")
        ttk.Label(self.top_panel, text="Table:").grid(row=0, column=0, sticky="e")

        # Search setup
        ttk.Label(self.top_panel, text="Search on:").grid(row=0,column=2,sticky="e")
        self.column_option = ttk.OptionMenu(self.top_panel,self.column_var, self.column_var.get(),*tree_columns)
        self.column_option.grid(row=0,column=3,sticky='e')
        self.search = ttk.Entry(self.top_panel)
        self.search.grid(row=0,column=4,sticky='e')
        search_button = ttk.Button(self.top_panel,text="Search",command=self.search_data)
        search_button.grid(row=0,column=5,sticky='e',padx=5)
        

    def _build_tree(self):
        """ This method is used to show the table from the database and shows it in the window """
        
        # Empty filler column on right
        new_tree_columns = tree_columns
        if not new_tree_columns[-1] == ' ':
            new_tree_columns.append(' ')
        
        # Table view
        self.tree = ttk.Treeview(columns=new_tree_columns, show="headings")
        vsb = ttk.Scrollbar(orient="vertical", command=self.tree.yview)
        hsb = ttk.Scrollbar(orient="horizontal", command=self.tree.xview)
        self.tree.configure(yscrollcommand=vsb.set, xscrollcommand=hsb.set)
        self.tree.grid(sticky='news', column=0, row=0, in_=self.container)
        vsb.grid(column=1, row=0, sticky='ns', in_=self.container)
        hsb.grid(column=0, row=1, sticky='ew', in_=self.container)

        self.container.grid_columnconfigure(0, weight=1)
        self.container.grid_rowconfigure(0, weight=1)
            
        for col in new_tree_columns:
            self.tree.heading(col, text=col.title(),
                command=lambda c=col: sortby(self.tree, c, 0))
            self.tree.column(col, width=tkFont.Font().measure(col.title())+10)
        
        try:
            for item in tree_data:
                self.tree.insert('', 'end', values=[str(i) for i in item])

                # adjust columns lenghts if necessary
                colwidth = 0
                for indx, val in enumerate(item):
                    ilen = tkFont.Font().measure(val)
                    if ilen > 150: ilen = 150
                    if self.tree.column(tree_columns[indx], width=None) < ilen:
                        ilen += 10
                        self.tree.column(tree_columns[indx], width=ilen)
                    colwidth += ilen
                        
            if len(tree_columns) >= 4:               
                self.colwidth = colwidth
            else:
                self.tree.column(len(tree_columns)-1, width=self.colwidth-colwidth)
        except UnboundLocalError:
            pass
    def _setup_popup(self):
        """ This method is invoken a user right clicks on the table, it will show the Add, Edit, Delete, and Print menu.
            1. Add Row will add the table with a new record/entry into the table.
            2. Edit Row will edit the chosen row's information
            3. Delete Row will delete the chosen row from the database
            4. Print Row will print the row's information in the terminal"""
        # Context menu
        self.context_menu = Tkinter.Menu(tearoff=0)
        self.context_menu.add_command(label="Add Row", command=self.add)
        self.context_menu.add_command(label="Edit Row", command=self.edit)
        self.context_menu.add_command(label="Delete Row", command=self.delete)
        self.context_menu.add_command(label="Print Row", command=self.printid)

        self.tree.bind("<Button-3>", self.popup)
        self.tree.bind("<Button-2>", self.popup)

    def _setup_form(self, action):
        """ This method will prompt the user with information needed, it varies according to its action command from the _setup_popup method """
        form_window = Tkinter.Toplevel()
        form_window.config(padx=10, pady=10)    
        entries = dict()
        ret = dict()
        for i in range(len(tree_columns)-1):
            Tkinter.Label(form_window, text='{}: '.format(tree_columns[i])).grid(column=0,row=i, sticky="w")
            entries[tree_columns[i]] = Tkinter.Entry(form_window, width=60)
            if action=='edit':
                try:
                    entries[tree_columns[i]].insert(0,self.item[tree_columns[i]])
                except KeyError:
                    pass
            entries[tree_columns[i]].grid(column=1,row=i)
        def formret():
            for k in entries.keys():
                ret[k] = entries[k].get()
            if action == 'add':
                gujek.insert(table, ret)
            elif action == 'edit':
                for k, v in self.item.items():
                    if not ret[k]: ret[k] = v
                gujek.edit(table, self.item, ret)
            self._refresh()
            form_window.destroy()
        if action == 'add':
            form_window.title('GuJek - Add entry')
            form_window.wm_iconbitmap('image/favicon.ico')
            btAdd = Tkinter.Button(form_window, text="Add entry", command=formret)
            btAdd.grid(row=len(tree_columns)+1, column=0, columnspan=2)
        if action == 'edit':
            form_window.title('GuJek - Edit entry')
            form_window.wm_iconbitmap('image/favicon.ico')
            btAdd = Tkinter.Button(form_window, text="Edit entry", command=formret)
            btAdd.grid(row=len(tree_columns)+1, column=0, columnspan=2)
            
    def _refresh(self,search=False):
        """ This method refreshes the table shown with the latest input"""
        global tree_columns, tree_data
        if not search:
            tree_columns = gujek.get_col_names(table)
            tree_data = gujek.show_table(table)
        self.tree.destroy()
        self._build_tree()
        self._setup_popup()

    def _set_table(self, value):
        """ This method will change the table shown in the window """
        global table, tree_columns
        table = value
        tree_columns = gujek.get_col_names(table)
        self.column_option.destroy()
        self.column_option = ttk.OptionMenu(self.top_panel,self.column_var, tree_columns[0],*tree_columns)
        self.column_option.grid(row=0,column=3,sticky='e')
        self._refresh()

    def popup(self, event):
        iid = self.tree.identify_row(event.y)
        self.item = dict(zip(tree_columns, self.tree.item(self.tree.focus())['values']))
        if 'phone' in self.item.keys():
            self.item['phone'] = '0' + str(self.item['phone'])  # Fix bug in self.tree.item
        if self.item and iid:
            self.tree.selection_set(iid)
            self.context_menu.post(event.x_root, event.y_root)
        else:
            pass
        
    def search_data(self,event = None):
        global tree_data, tree_columns
        search_term = self.search.get()
        search_by = self.column_var.get()
        coltype = gujek.get_col_types(table)[search_by]
        if coltype == 'integer':
            try:
                search_term = int(search_term)
            except ValueError:
                mb.showinfo("No results found","Search returns 0 result.")
                return
        tree_data = gujek.search(table, search_by, search_term)
        if tree_data:
            self._refresh(True)
        else:
            mb.showinfo("No results found","Search returns 0 result.")
        
    def add(self):
        self._setup_form('add')

    def edit(self):
        self._setup_form('edit')

    def delete(self):
        prompt = mb.askokcancel("Delete table entry?",
        "Are you sure you want to delete this table entry?\n\nTable: {}\nEntry: {}".format(table, self.item))
        if prompt:
            gujek.delete(table, self.item)
            self._refresh()

    def printid(self):
        print(self.item)

def main():
    app = App()
    app.mainloop()

if __name__ == "__main__":
    main()
