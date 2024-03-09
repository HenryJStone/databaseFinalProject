import streamlit as st
import utils.stops as stops
import utils.current_buses as cb
import utils.routes as route
import utils.buses as bus
import utils.status as status
import utils.requests as rq
import utils.search as search

conn = st.connection('mysql', type='sql')
st.markdown("<h1 style='text-align: center; '>Bus E System</h1>", unsafe_allow_html=True)
cb_tab, routes_tab, stops_tab, buses_tab, status_tab, route_request, search_bus = st.tabs(['Current Buses', 'Routes', 'Stops', 'Buses', 'Check-in/Check-out', 'Route Requests', 'Search'])
with cb_tab:
    cb.display_page()
with stops_tab:
    stops.display_page()
with routes_tab:
    route.display_page()
with buses_tab:
    bus.display_page()
with status_tab:
    status.display_page()
with route_request:
    rq.display_page()
with search_bus:
    search.display_page()