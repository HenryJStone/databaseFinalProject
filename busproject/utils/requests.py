import streamlit as st
import pandas as pd
import mysql.connector as mc
import utils.secret as sc
import random
cn = mc.connect(user=sc.username, password=sc.password, host=sc.host, database=sc.database)

def display_page():   
    s1 = int(st.number_input('Stop One', min_value=1, step=1, placeholder='Choose a route number'))
    s2 = int(st.number_input('Stop Two', min_value=1, step=1, placeholder='Choose a route number'))
    s3 = int(st.number_input('Stop Three', min_value=1, step=1, placeholder='Choose a route number'))
    s4 = int(st.number_input('Stop Four', min_value=1, step=1, placeholder='Choose a route number'))
    s5 = int(st.number_input('Stop Five', min_value=1, step=1, placeholder='Choose a route number'))
    s6 = int(st.number_input('Stop Six', min_value=1, step=1, placeholder='Choose a route number'))
    s7 = int(st.number_input('Stop Seven', min_value=1, step=1, placeholder='Choose a route number'))
    s8 = int(st.number_input('Stop Eight', min_value=1, step=1, placeholder='Choose a route number'))
    s9 = int(st.number_input('Stop Nine', min_value=1, step=1, placeholder='Choose a route number'))
    s10 = int(st.number_input('Stop Ten', min_value=1, step=1, placeholder='Choose a route number')) 
    if st.button('Add Route'):
         
        get_max = pd.read_sql('SELECT MAX(route_num) AS route_num FROM routes', cn)
        new_num = int(get_max['route_num'].iloc[0] + 1)
        q = 'INSERT INTO routes VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
        x = 'UPDATE current_buses SET route_num = %s WHERE bus_num = %s'
        rs = cn.cursor()
        rs.execute(q, (new_num,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10))
        rs.execute(x, (new_num, 101))
        cn.commit()
        rs.close()
    
    route_num = int(st.number_input('Route Number', step=1, min_value=1))
    if st.button('Delete Route'):
        get_min = pd.read_sql('SELECT MIN(route_num) AS route_num FROM routes', cn)
        new_num = int(get_min['route_num'].iloc[0])
        p = 'UPDATE current_buses SET route_num = %s WHERE route_num = %s'
        #p = f'UPDATE route_num FROM (SELECT route_num FROM current_buses WHERE route_num = {route_num})'
        q = f'DELETE FROM routes WHERE route_num = {route_num}'
        rs = cn.cursor()
        rs.execute(p, (random.randint(1, 10),route_num))
        rs.execute(q)
        cn.commit()
        rs.close()
    
