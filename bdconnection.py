import pyodbc

try:
    conn = pyodbc.connect(
        "Driver={ODBC Driver 18 for SQL Server};"
        "Server=farmaciamariendb.mssql.somee.com,1433;"
        "Database=farmaciamariendb;"
        "Encrypt=yes;"
        "UID=Iamtheadmin;"
        "PWD=this.proof.haha;"
        "TrustServerCertificate=yes;"
        "MARS_Connection=Yes;"
        # https://www.jasoft.org/Blog/post/resolver-error-al-conectarse-a-sql-server-debido-al-certificado-ssl

    )
    conn.setdecoding(pyodbc.SQL_CHAR, encoding='unicode_escape')
    conn.setdecoding(pyodbc.SQL_WCHAR, encoding='unicode_escape')
    conn.setdecoding(pyodbc.SQL_WMETADATA, encoding='unicode_escape')
    conn.setdecoding(pyodbc.SQL_WMETADATA, encoding='utf-16le')
    # Esta parte del código imprime el consola el máximo de conexiones
    # how_many = conn.getinfo(pyodbc.SQL_MAX_CONCURRENT_ACTIVITIES)
    # print(f"Máximo de conexiones: ", how_many)
except Exception as e:
    print("Ocurrió un error al conectar a SQL Server: ", e)
