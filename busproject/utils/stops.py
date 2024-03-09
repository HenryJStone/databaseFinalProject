import streamlit as st
conn = st.connection('mysql', type='sql')
def display_page():
    st.cache_data.clear()
    stops = conn.query('SELECT * FROM stops')
    st.table(stops)
