import psycopg2, datetime, getpass

class GujekAdmin:
    
    def __init__(self, user, dbname, host, password = None):
        """ This class is used to connect the database Postgresql with the GUI through python programming """
        self.conn = psycopg2.connect('user={} dbname={} host={} password = {}'.format(user,dbname,host,password))
        self.cur = self.conn.cursor()
        self._pass = password

    def query(self, querystr):
        try:
            self.cur.execute(querystr)
            self.conn.commit()
        except psycopg2.Error as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))
        ret = self.cur.fetchall()
        return ret if ret else None
            
    def show_table(self, tablename):
        """ This method will show a table in the database
            tablename = The table name """
        try:
            return self.query("SELECT * FROM {};".format(tablename))
        except psycopg2.ProgrammingError as e:
            print(e)
            
    def print_table(self, tablename):
        """ This method will print the table in the IDLE
            tablename = The table name """
        try:
            self.cur.execute('SELECT * FROM {};'.format(tablename))
            columns = [desc[0] for desc in self.cur.description]
            self.conn.commit()
            print(', '.join(columns))
            table = self.cur.fetchall()
            for tup in table:
                print(', '.join([str(i) for i in tup]))
        except (psycopg2.Error,UnboundLocalError) as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))

    def search(self, tablename, searchby, value):
        """ This method will search the database for the given value and return its value
            tablename = The table name
            searchby =
            value = The search key """
        try:
            if type(value) == int:
                ret = self.query("SELECT * FROM {} WHERE {}={};".format(tablename, searchby, value))
            elif type(value) == str:
                ret = self.query("SELECT * FROM {} WHERE {} LIKE '%{}%';".format(tablename, searchby, value))
            elif type(value) == datetime.datetime:
                value = str(value)
                ret = self.query("SELECT * FROM {} WHERE {}='{}';".format(tablename, searchby, value))
            elif type(value) == datetime.date:
                value = str(value)
                ret = self.query("SELECT * FROM {} WHERE {}='{}';".format(tablename, searchby, value))
        except NameError:
            print('Your search returned 0 results.')
            return None

    def insert(self, tablename, data):
        """ This method will insert a new data to the database
            tablename = The table name
            data = The data to be input """
        colstr = ', '.join(data.keys())
        valstr = "'" + "', '".join(data.values()) + "'"
        self.query("INSERT INTO {} ({}) VALUES ({});".format(tablename,columns,values))

    def delete(self, tablename, searchby, value):
        """ This method will delete data from the database
            tablename = The table name
            searchby = 
            value = The data to be deleted """
        if not search(tablename, searchby, value):
            print('Transaction failed: record not found.')
            return
        self.query("DELETE FROM {} WHERE {}='{}';".format(tablename,searchby,value))
        
    def edit(self, tablename, searchby, value, data):
        """ This method will edit a chosen data from the database
            tablename = The table name
            searchby = 
            value = The data to be edited
            data = The new data for value"""
        if not search(tablename, searchby, value):
            print('Transaction failed: record not found.')
            return
        columns = data.keys()
        values = data.values()
        setstr = ', '.join(['{}={}'.format(c,v) for c,v in zip(columns, values)])
        self.query("UPDATE {} SET {} WHERE {}={};".format(tablename, setstr, columns[0], values[0]))

if __name__ == '__main__':
    pw = getpass.getpass()
    gujek = GujekAdmin('postgres', 'gujek', 'localhost', '<Enter>')
