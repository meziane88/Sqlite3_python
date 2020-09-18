# utiliser Python avec SQLlite 

import sqlite3 
connexion = sqlite3.connect("factbook.db")

c = connexion.cursor()
c.execute('select * from facts;')
print(c.fetchall())
c.close()

