import pyodbc

def conect_ao_banco(driver='SQL Server Native Client 11.0', server='DESKTOP-SKOI3FG', database='BDSpotPer', username=None, password=None, trusted_connection='yes'):

    string_conexao = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password};TRUSTED_CONNECTION={trusted_connection}"

    conexao = pyodbc.connect(string_conexao)
    cursor = conexao.cursor()

    return conexao, cursor

conexao, cursor = conect_ao_banco()

resultado = cursor.execute('SELECT * FROM Faixas').fetchall()

#print(cursor.execute('SELECT * FROM Faixas').fetchall) ele printa tudo um do lado do outro
#For aki fz printar mais bonitp

for linha in resultado:
    print(linha)
