# HR Analytics dashboard

Detta projekt demonstrerar en end-to-end datapipeline och analysflöde för HR-data med hjälp av:

- **DLT (Data Load Tool)** för datahämtning
- **dbt** för transformationer
- **Streamlit** för visualisering

---

## 🚀 Arbetsflöde

1. **Kör DLT-pipelinen**
    Laddar in rådata till Snowflake.

2. **Kör dbt-modeller**
    Transformerar rådata till analysfärdiga tabeller.

3. **Starta Streamlit-dashboard**
    Visualiserar resultatet.

---

## 🔑 Konfiguration

Du behöver två konfigurationsfiler för att ansluta till Snowflake.

### 1. `secrets.toml` (för DLT)
Skapa en fil med namnet `secrets.toml` i din DLT-mapp:

```toml
[destination.snowflake.credentials]
database = "<YOUR_DATABASE>"
username = "<YOUR_USERNAME>"
password = "<YOUR_PASSWORD>"
host = "<YOUR_ACCOUNT>"
warehouse = "<YOUR_WAREHOUSE>"
role = "<YOUR_ROLE>"
```

---

### 2. `.env` (för dbt + Streamlit)
Skapa en `.env` fil i projektets rotmapp:

```env
SNOWFLAKE_USER="<YOUR_USERNAME>"
SNOWFLAKE_PASSWORD="<YOUR_PASSWORD>"
SNOWFLAKE_ACCOUNT="<YOUR_ACCOUNT>"
SNOWFLAKE_WAREHOUSE="<YOUR_WAREHOUSE>"
SNOWFLAKE_DATABASE="<YOUR_DATABASE>"
SNOWFLAKE_SCHEMA="<YOUR_SCHEMA>"
SNOWFLAKE_ROLE="<YOUR_ROLE>"
```

⚠️ **Lägg inte upp dessa filer på GitHub.** Lägg till dem i .gitignore.

---

## ⚙️ Installation

Klona projektet och installera beroenden:

```bash
git clone https://github.com/IrinaAntipina/hr-analytics-proof-of-concept.git
cd hr-analytics-proof-of-concept
pip install -r requirements.txt
```

---

## ▶️ Hur man kör

1. **Kör DLT-pipelinen**
    ```bash
   python load_job_ads.py
   ```

2. **Kör dbt transformation**
    ```bash
   dbt run
   ```

3. **Kör streamlit**
   ```bash
   streamlit run dashboard.py
   ```

---

## 📂 Projektstruktur

```
.
├── dlt_pipeline.py       # Data ingestion into Snowflake
├── dbt_project/          # dbt models and configs
├── dashboard.py          # Streamlit dashboard
├── requirements.txt      # Python dependencies
├── secrets.toml          # (local only) Snowflake creds for DLT
└── .env                  # (local only) Snowflake creds for dbt + Streamlit
```

---

## ✅ Notes

- Kör stegen **i rätt ordning**: **DLT → dbt → Streamlit**
- Skydda dina credentials (`.env` och `secrets.toml` måste finnas i `.gitignore`)
- Uppdatera Snowflake-inställningar innan körning

