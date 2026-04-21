# 📊 Jobtech Analytics Dashboard

Ett komplett data pipeline- och visualiseringsprojekt som analyserar jobbannonser från Jobtech API. Projektet bygger en modern data stack med DLT, Snowflake, dbt och Streamlit för att extrahera, transformera och visualisera arbetsmarknadsdata.

# 🚀 Översikt

Projektet består av fyra huvuddelar:
Data ingestion (DLT)
Hämtar jobbannonser från Jobtech API och laddar dem till Snowflake.
Data warehouse (Snowflake)
Lagrar rådata (staging) och transformerad data (warehouse + marts).
Transformation (dbt)
Bygger dimensioner och faktatabeller samt färdiga analysmodeller.
Dashboard (Streamlit)
Visualiserar data i ett interaktivt gränssnitt.

# 🏗️ Arkitektur

Jobtech API
     ↓
   DLT 
     ↓
 Snowflake
     ↓
   dbt 
     ↓
Streamlit Dashboard

🗂️ Mapp struktur

│
├── dlt/
│   └── load_job_ads.py          # Data ingestion via Jobtech API
│
├── dbt_code/
│   ├── models/
│   │   ├── src/                 # Source models
│   │   ├── fct/                 # Faktatabeller
│   │   ├── dim/                 # Dimensioner
│   │   └── mart/                # Analyslager
│   └── dbt_project.yml
│
├── dashboard/
│   ├── dashboard.py             # Streamlit app
│   ├── conn_warehouse.py        # Snowflake connection
│   └── components/              # Visualiseringar
│
├── .env                         # Credentials (ej commit)
└── README.md
# ⚙️ Installation

1. Klona projektet
git clone <repo-url>


2. Skapa virtual environment
python -m venv .venv
source .venv/bin/activate

3. Installera dependencies
pip install -r requirements.txt

# 🔐 Miljövariabler

Skapa en .env-fil:
SNOWFLAKE_USER=your_user
SNOWFLAKE_PASSWORD=your_password
SNOWFLAKE_ACCOUNT=your_account
SNOWFLAKE_WAREHOUSE=JOB_ANALYSIS_WH
SNOWFLAKE_DATABASE=JOBTECH_ANALYSIS
SNOWFLAKE_SCHEMA=MARTS_MARTS
SNOWFLAKE_ROLE=JOBTECH_STREAMLIT_ROLE
# 📥 Steg 1 – Ladda data (DLT)

cd dlt
python load_job_ads.py
Data laddas till:
JOBTECH_ANALYSIS.STAGING.JOB_ADS

# 🔄 Steg 2 – Bygg datamodell (dbt)

cd dbt_code
dbt run
Detta skapar:
Warehouse:
dim_employer
dim_job_details
dim_occupation
dim_auxilliary_attributes
fct_job_ads
Marts:
mart_main
mart_HRS
mart_IDU
mart_TDL
Schema:
JOBTECH_ANALYSIS.MARTS_MARTS

# 📊 Steg 3 – Starta dashboard

cd dashboard
streamlit run dashboard.py

# 📈 Funktioner
Dashboard innehåller:

# 📊 KPI:er

Totala jobb
Erfarenhetskrav
Körkortskrav

# 💼 Top occupations

# 🏢 Top employers

# 🗺️ Geografisk visualisering

# 📊 Filter per yrkesområde:

Hotell & restaurang
Installation & drift
Transport & logistik

# 🧠 Teknologier

Python
DLT (Data Load Tool)
Snowflake
dbt (Data Build Tool)
Streamlit

