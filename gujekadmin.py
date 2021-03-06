import psycopg2, datetime
from psycopg2.extensions import adapt

class GujekAdmin:
    
    def __init__(self, user, dbname, host, password=None):
        """ This class is used to connect the database Postgresql with the GUI through python programming """
        self.conn = psycopg2.connect('user={} dbname={} host={} password={}'.format(user,dbname,host,password))
        self.cur = self.conn.cursor()
        self._pass = password

    def query(self, querystr):
        """ This method is used to access the database using Postgresql """
        try:
            self.cur.execute(querystr)
            self.conn.commit()
        except psycopg2.Error as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))
        try:
            ret = self.cur.fetchall()
        except:
            ret = None
        return ret
            
    def show_table(self, tablename):
        """ This method will show a table in the database
            tablename (str) = The table name """
        try:
            return self.query("SELECT * FROM {};".format(tablename))
        except psycopg2.Error as e:
            print(e)
            
    def print_table(self, tablename):
        """ This method will print the table in the IDLE
            tablename (str) = The table name """
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
            tablename (str) = The table name
            searchby (str) = The column name
            value (str) = The search key """
        coltypes = self.get_col_types(tablename)
        multiword = ('name', 'type', 'goods', 'license',
                     'education', 'restaurant', 'comment',
                     'menu_item', 'address', 'destination')
        try:
            if coltypes[searchby] == 'integer':
                querystr = "SELECT * FROM {} WHERE CAST({} AS TEXT) LIKE '{}%';".format(tablename, searchby, value)
            elif coltypes[searchby] == 'character varying' or coltypes[searchby] == 'text' and searchby in multiword:
                querystr = "SELECT * FROM {} WHERE {} ILIKE '%{}%';".format(tablename, searchby, value)
            elif coltypes[searchby] == 'character varying' or coltypes[searchby] == 'text' and searchby not in multiword:
                querystr = "SELECT * FROM {} WHERE {} ILIKE '{}%';".format(tablename, searchby, value)
            elif coltypes[searchby] == 'timestamp without time zone' or coltypes[searchby] == 'date':
                value = str(value)
                querystr = "SELECT * FROM {} WHERE {}='{}';".format(tablename, searchby, value)
            ret = self.query(querystr)
            return ret
        except NameError as e:
            print(e)
            print('Your search returned 0 results.')
            return None

    def insert(self, tablename, data):
        """ This method will insert a new data to the database
            tablename (str )= The table name
            data = The data to be input """
        coltypes = self.get_col_types(tablename)
        for v in data.values():
            if type(v) is str:
                v = adapt(str(v))
            if type(v) is int:
                v = str(v)
        try:
            colstr = ', '.join(data.keys())
            valstr = "'" + "', '".join(tuple(v for v in data.values())) + "'"
            self.query("INSERT INTO {} ({}) VALUES ({});".format(tablename,colstr,valstr))
        except TypeError as e:
            print('Please input the correct information needed')
            
    def delete(self, tablename, data={}):
        """ This method will delete data from the database
            tablename (str) = The table name
            data (dict) = The data that specifies deletion condition"""
        wherestr = ""
        for k, v in data.items():
            if type(v) is str: v = "'{}'".format(v)
            wherestr += "{}={} AND ".format(k, v)
        wherestr = wherestr[:-5]
        q = "DELETE FROM {} WHERE {};".format(tablename,wherestr)
        self.query(q)
        print(q)
        
    def edit(self, tablename, old_data={}, data={}):
        """ This method will edit a chosen data from the database
            tablename (str) = The table name
            searchby (str) = The column name
            value (str) = The data to be edited
            data (str) = The new data for value""" 
        wherestr = ""
        for k, v in old_data.items():
            if type(v) is str: v = adapt(v)
            wherestr += "{}={} AND ".format(k, v)
        wherestr = wherestr[:-5]
        q = "SELECT * FROM {} WHERE {};".format(tablename, wherestr)
        if not self.query(q):
            print('Transaction failed: record not found.')
            return
        
        columns = data.keys()
        values = data.values()
        setstr = ', '.join(["{}={}".format(c,adapt(v)) for c,v in zip(columns, values)])
        self.query("UPDATE {} SET {} WHERE {};".format(tablename, setstr, wherestr))

    def get_pkey(self, tablename):
        """ This method is used to retrieve the primary key """
        ret = self.query("""SELECT column_name
                            FROM information_schema.table_constraints
                                 JOIN information_schema.key_column_usage
                                     USING (constraint_catalog, constraint_schema, constraint_name,
                                            table_catalog, table_schema, table_name)
                            WHERE constraint_type = 'PRIMARY KEY'
                              AND (table_schema, table_name) = ('public', '{}')
                            ORDER BY ordinal_position;""".format(tablename))
        return tuple(r[0] for r in ret) if ret else None

    def get_col_names(self, tablename):
        """ This method is used to retrieve the column names """
        try:
            self.cur.execute('SELECT * FROM {};'.format(tablename))
            columns = [desc[0] for desc in self.cur.description]
            self.conn.commit()
        except psycopg2.Error as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))
        return columns

    def get_table_names(self):
        """ This method is used to retrieve the table's name """
        try:
            self.cur.execute("SELECT relname FROM pg_class WHERE relkind='r' AND relname !~ '^(pg_|sql_)';")
            return tuple(tablename[0] for tablename in self.cur.fetchall())
        except psycopg2.Error as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))

    def get_col_types(self, tablename):
        """ This method is used to retrieve the column type """
        try:
            self.cur.execute("SELECT column_name, data_type FROM information_schema.columns WHERE table_name='{}';".format(tablename))
            return {k: v for k,v in self.cur.fetchall()}
        except psycopg2.Error as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))

if __name__ == '__main__':
    gujek = GujekAdmin('gujekadmin', 'gujek', 'localhost', 'admin1')
