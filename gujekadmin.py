import psycopg2, datetime

class GujekAdmin:
    def __init__(self, user, dbname, host):
        self.conn = psycopg2.connect('user={} dbname={} host={}'.format(user,dbname,host))
        self.cur = self.conn.cursor()

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
        return self.query("SELECT * FROM {};".format(tablename))
        
    def print_table(self, tablename):
        try:
            self.cur.execute('SELECT * FROM {};'.format(tablename))
            columns = [desc[0] for desc in self.cur.description]
            self.conn.commit()
        except psycopg2.Error as e:
            self.conn.rollback()
            print('Transaction failed: {}'.format(e))
        
        table = self.cur.fetchall()
        result = []
        result.append(', '.join(columns))
        for tup in table:
            result.append(', '.join([str(i) for i in tup]))
        return result

    def search(self, tablename, searchby, value):
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
            return ret
        except NameError:
            print('Your search returned 0 results.')
            return None

    def insert(self, tablename, data):
        colstr = ', '.join(data.keys())
        valstr = "'" + "', '".join(data.values()) + "'"
        self.query("INSERT INTO {} ({}) VALUES ({});".format(tablename,columns,values))

    def delete(self, tablename, searchby, value):
        if not search(tablename, searchby, value):
            print('Transaction failed: record not found.')
            return
        self.query("DELETE FROM {} WHERE {}='{}';".format(tablename,searchby,value))
        
    def edit(self, tablename, searchby, value, data):
        if not search(tablename, searchby, value):
            print('Transaction failed: record not found.')
            return
        columns = data.keys()
        values = data.values()
        setstr = ', '.join(['{}={}'.format(c,v) for c,v in zip(columns, values)])
        self.query("UPDATE {} SET {} WHERE {}={};".format(tablename, setstr, columns[0], values[0]))

if __name__ == '__main__':
    gujek = GujekAdmin('irsyadnabil', 'gujek', 'localhost')
