import streamlit as st
import snowflake.connector
import pandas as pd




st.set_page_config(page_title="HR Analytics Dashboard", layout="wide")


st.title("📊 HR Analytics Dashboard")
st.markdown("Ett interaktivt verktyg för att analysera platsannonser från Arbetsförmedlingen.")




col1, col2, col3, col4 = st.columns(4)
with col1:
    st.metric("Totalt antal annonser", 1234)
with col2:
    st.metric("Stockholm", 300)
with col3:
    st.metric("Göteborg", 150)
with col4:
    st.metric("Malmö", 120)


st.markdown("---")






data = {
    "Stad": ["Stockholm", "Göteborg", "Malmö", "Uppsala", "Västerås"],
    "Antal annonser": [300, 150, 120, 80, 50],
    "Yrkesområde": [
        "Hotell, restaurang, storhushåll, Installation, drift, underhåll",
        "Hotell, restaurang, storhushåll, Installation, drift, underhåll",
        "Hotell, restaurang, storhushåll, Installation, drift, underhåll",
        "Hotell, restaurang, storhushåll, Installation, drift, underhåll",
        "Hotell, restaurang, storhushåll, Installation, drift, underhåll"
    ]
}
df = pd.DataFrame(data)




col_a, col_b = st.columns(2)


with col_a:
    st.subheader("📍 Annonser per stad")
    st.bar_chart(df.set_index("Stad")["Antal annonser"])


with col_b:
    st.subheader("📌 Andel annonser per stad")
    st.dataframe(df)


st.markdown("---")




st.subheader("🔎 Filtrera annonser")
selected_city = st.selectbox("Välj stad", df["Stad"].unique())
filtered = df[df["Stad"] == selected_city]


st.write(f"**Vald stad:** {selected_city}")
st.table(filtered)

    