#code for checkin/checkout
import streamlit as st
import pandas as pd
import mysql.connector as mc
import utils.secret as sc
import utils.current_buses as curr
conn = st.connection('mysql', type='sql')
cn = mc.connect(user=sc.username, password=sc.password, host=sc.host, database=sc.database)

def display_page():
    st.cache_data.clear()
    st.markdown("<h3 style='text-align: center; '>Check in or out of your bus</h1>", unsafe_allow_html=True)

    b_id = int(st.number_input('Bus Number', min_value=101, step=1))
    if st.button('Check in'):
        st.table(conn.query(f'SELECT * FROM current_buses WHERE bus_num = {b_id}'))
        result = conn.query('SELECT open_seats FROM current_buses WHERE bus_num = {b_id}')
        df = pd.DataFrame(result)
        num = int(df['open_seats'].iloc[0] - 1)
        q = 'UPDATE current_buses SET open_seats = %s WHERE bus_num = %s'
        rs = cn.cursor()
        rs.execute(q, (num,b_id))
        cn.commit()
        rs.close()
        st.rerun()

    if st.button('Check out'):
        st.write('thank you for traveling with us!')
        result = conn.query(f'SELECT open_seats FROM current_buses WHERE bus_num = {b_id}')
        df = pd.DataFrame(result)
        num = int(df['open_seats'].iloc[0] + 1)
        q = 'UPDATE current_buses SET open_seats = %s WHERE bus_num = %s'
        rs = cn.cursor()
        rs.execute(q, (num,b_id))
        cn.commit()
        rs.close()
        
             