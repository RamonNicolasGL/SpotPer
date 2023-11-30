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


############# TESTAR AINDA
def listar_albums(cursor):
    query = 'SELECT AlbumId, NomeAlbum FROM Albuns'
    cursor.execute(query)
    albums = cursor.fetchall()
    for album in albums:
        print(f"{album.AlbumId}: {album.NomeAlbum}")
    return albums

def listar_faixas_do_album(cursor, album_id):
    query = f'SELECT * FROM Faixas WHERE AlbumId = {album_id}'
    cursor.execute(query)
    faixas = cursor.fetchall()
    for faixa in faixas:
        print(f"{faixa.FaixaId}: {faixa.NomeFaixa}")
    return faixas

conexao, cursor = conectar_ao_banco()

# Listar todos os álbuns
albums = listar_albums(cursor)

# Permitir a seleção de um álbum
while True:
    try:
        album_id_selecionado = int(input("Selecione o ID do álbum desejado: "))
        break
    except ValueError:
        print("Por favor, insira um número válido.")

# Listar todas as faixas do álbum selecionado
listar_faixas_do_album(cursor, album_id_selecionado)

# Fechar a conexão com o banco de dados
conexao.close()
