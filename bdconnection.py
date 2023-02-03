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
        # https://www.jasoft.org/Blog/post/resolver-error-al-conectarse-a-sql-server-debido-al-certificado-ssl

    )
except Exception as e:
    print("Ocurrió un error al conectar a SQL Server: ", e)
