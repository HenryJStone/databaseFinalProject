import streamlit as st
import pandas as pd
import mysql.connector as mc
import utils.secret as sc
cn = mc.connect(user=sc.username, password=sc.password, host=sc.host, database=sc.database)
def display_page():
    start = st.number_input('enter current stop number', step=1)
    stop = st.number_input('enter destination stop number', step=1)
    time_delay = st.number_input('enter allowed delay', step=1, min_value=5)

    q = f'''SELECT bus_num FROM current_buses JOIN routes USING (route_num) 
            WHERE {start} IN (stop1, stop2, stop3, stop4, stop5, stop6, stop7, stop8, stop9, stop10)
            AND {stop} IN (stop1, stop2, stop3, stop4, stop5, stop6, stop7, stop8, stop9, stop10) AND min_late <= {time_delay}
            ORDER BY open_seats ASC'''

    if st.button('Search Buses'):
        df = pd.read_sql(q, cn)
        if df.size > 0:
            st.write('Least busy to most busy')
            st.table(df)
        else:
            st.write('No buses currently match your requests, please add a route')



