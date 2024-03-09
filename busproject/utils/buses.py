import streamlit as st
conn = st.connection('mysql', type='sql')
def display_page():
    buses = conn.query('SELECT * FROM buses')
    st.table(buses)