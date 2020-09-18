# Calculer le ratio de la surface terrestre totale sur la surface des océans 
# totale appartenant aux pays de  la table facts 

import sqlite3
import pandas as pd 

connexion = sqlite3.connect('factbook.db')

a = pd.read_sql_query('select sum(area_land), sum(area_water) from facts where area_land != "";', con = connexion)

print(a['sum(area_land)']/ a['sum(area_water)'])
