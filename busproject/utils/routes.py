import streamlit as st

conn = st.connection('mysql', type='sql')
def display_page():
   st.cache_data.clear()
   routes = conn.query('SELECT * FROM routes',)
   st.table(routes)