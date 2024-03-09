import streamlit as st
def display_page():
   conn = st.connection('mysql', type='sql')
   st.cache_data.clear()
   buses = conn.query('SELECT * FROM current_buses',)
   st.table(buses)
   

