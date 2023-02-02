import pyodbc

try:
    conn = pyodbc.connect(
        "Driver={ODBC Driver 18 for SQL Server};"
        "Server=farmaciamarienserver.database.windows.net;"
        "Database=farmaciamariendb;"
        "ENCRYPT=yes;"
        "UID=developers;"
        "PWD=admin123*"
    )
except Exception as e:
    print("Ocurrió un error al conectar a SQL Server: ", e)
