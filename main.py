import psycopg2
db = psycopg2.connect(atabase='fn27',user='postgres',host='localhost',password='1')
cursor = db.cursor()
cursor.execute('''select * from products''')
products = cursor.fetchall
print(products)
db.commit()
db.close()