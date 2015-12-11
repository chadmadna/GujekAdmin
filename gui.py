from tkinter import *
from tkinter.ttk import *

##master = Tk()
##
##scrollbar = Scrollbar(master)
##scrollbar.pack(side=RIGHT, fill=Y)
##
##listbox = Listbox(master, yscrollcommand=scrollbar.set)
##for i in range(1000):
##    listbox.insert(END, str(i))
##listbox.pack(side=LEFT, fill=BOTH)
##
##scrollbar.config(command=listbox.yview)
##
##mainloop()
class GUIjek:
    def __init__(self):
        root = Tk()
        root.title("Gujek Database")

        #Initiate frame
        
        buttonsframe=Frame(root)
        buttonsframe.grid(row=0,column=0,sticky=N+W+E)
        treeframe=Frame(root)
        treeframe.grid(row=0,column=1,sticky=N+W+E+S)
        
        #Initiate buttons
        
        buttonAdd=Button(buttonsframe,width=15,text='Add to Database',command=self.add)
        buttonUpd=Button(buttonsframe,width=15,text='Update entry',command=self.update)
        buttonDel=Button(buttonsframe,width=15,text='Delete entry',command=self.delete)
        buttonAdd.pack()
        buttonUpd.pack()
        buttonDel.pack()

        #Initiate tree

        self.tree = Treeview(treeframe,show='headings',columns=('uji','peler'))
        self.tree.pack(fill=BOTH,expand=1)
    def update(self):
        master=Toplevel()
        Label(master, text="First").grid(row=0,sticky=W)
        Label(master, text="Second").grid(row=1,sticky=W)

        e1 = Entry(master)
        e2 = Entry(master)

        e1.grid(row=0, column=1,sticky=W+E)
        e2.grid(row=1, column=1,sticky=W+E)
                
        var = StringVar(master)
        var.set("one") # initial value

        option = OptionMenu(master, var, "one", "two", "three", "four")
        option.grid(row=3)
    def add(self):
        pass
    def delete(self):
        pass
        
        
w = GUIjek()
