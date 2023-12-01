import pyodbc

def conect_ao_banco(driver='SQL Server Native Client 11.0', server='DESKTOP-SKOI3FG', database='BDSpotPer', username=None, password=None, trusted_connection='yes'):

    string_conexao = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password};TRUSTED_CONNECTION={trusted_connection}"

    conexao = pyodbc.connect(string_conexao)
    cursor = conexao.cursor()

    return conexao, cursor

conexao, cursor = conect_ao_banco()

#resultado = cursor.execute('SELECT * FROM Playlist').fetchall()

#print(cursor.execute('SELECT * FROM Faixas').fetchall) ele printa tudo um do lado do outro
#For aki fz printar mais bonitp

#for linha in resultado:
#    print(linha)

def criar_playlist(nome_playlist, id_playlist):
    conexao, cursor = conect_ao_banco()

    try:
        # Inserir a nova playlist no banco de dados
        cursor.execute("INSERT INTO Playlist (id_playlist, nome) VALUES (?, ?)", id_playlist, nome_playlist)
        conexao.commit()
        print(f"Playlist '{nome_playlist}' criada com sucesso!")

    except Exception as e:
        print(f"Erro ao criar a playlist: {str(e)}")

    finally:
        conexao.close()


def listar_albums():
    conexao, cursor = conect_ao_banco()

    try:
        # Listar todos os álbuns
        cursor.execute("SELECT id_album, descricao FROM Album")
        albuns = cursor.fetchall()

        # Exibir opções para o usuário escolher um álbum
        print("Escolha um álbum:")
        for album in albuns:
            print(f"{album.id_album}: {album.descricao}")

        escolha_album = int(input("Digite o código do álbum que deseja adicionar a playlist: "))
        return escolha_album

    except Exception as e:
        print(f"Erro ao listar álbuns: {str(e)}")

    finally:
        conexao.close()

def listar_faixas_do_album(id_album_fk):
    conexao, cursor = conect_ao_banco()

    try:
        # Listar todas as faixas do álbum escolhido
        cursor.execute("SELECT id_faixa, desc_faixa FROM Faixas WHERE id_album_fk = ?", id_album_fk)
        faixas = cursor.fetchall()

        # Exibir opções para o usuário escolher faixas
        print("Escolha as faixas que deseja adicionar à playlist:")
        for faixa in faixas:
            print(f"{faixa.id_faixa}: {faixa.desc_faixa}")

        escolha_faixas = [int(x) for x in input("Digite os códigos das faixas separados por espaço: ").split()]
        return escolha_faixas

    except Exception as e:
        print(f"Erro ao listar faixas do álbum: {str(e)}")

    finally:
        conexao.close()




# Após a escolha das faixas, chame a função para adicionar as faixas à playlist
#adicionar_faixas_a_playlist(id_playlist, faixas_escolhidas)

# Solicitar input do usuário para o nome e ID da playlist
#nome_playlist = input("Digite o nome da playlist: ")
#id_playlist = int(input("Digite o ID da playlist: "))

# Chamar a função para criar a playlist
#criar_playlist(nome_playlist, id_playlist)

def List_Albuns_Faixas(id_playlist, adicionar_faixas):
# Listar álbuns e faixas para adicionar à playlist
    if adicionar_faixas == 1:
        while True:
            cod_album_escolhido = listar_albums()
            faixas_escolhidas = listar_faixas_do_album(cod_album_escolhido)

            # Adicionar as faixas à playlist (substitua esta parte com a lógica real de inserção no banco de dados)
            adicionar_faixas_a_playlist(id_playlist, faixas_escolhidas)

            # Perguntar ao usuário se deseja continuar adicionando faixas
            continuar_adicionando_faixas = int(input("Deseja continuar adicionando faixas à playlist?\n 1): Sim \n 2: Não: "))
            if continuar_adicionando_faixas != 1:
                        break

def adicionar_faixas_a_playlist(id_playlist, faixas_escolhidas):
    conexao, cursor = conect_ao_banco()

    try:
        for id_faixa in faixas_escolhidas:
            # Inserir o relacionamento entre a faixa e a playlist na tabela FaixasPlaylist
            cursor.execute("INSERT INTO Playlist_Faixas (faixa, playlist) VALUES (?, ?)", id_faixa, id_playlist)

        conexao.commit()
        print("Faixas adicionadas à playlist com sucesso!")

    except Exception as e:
        print(f"Erro ao adicionar faixas à playlist: {str(e)}")

    finally:
        conexao.close()


def listar_playlists():
    conexao, cursor = conect_ao_banco()

    try:
        # Listar todos os álbuns
        cursor.execute("SELECT id_playlist, nome FROM Playlist")
        playlists = cursor.fetchall()

        # Exibir opções para o usuário escolher um álbum
        print("Escolha a Playlist:")
        for playlist in playlists:
            print(f"{playlist.id_playlist}: {playlist.nome}")

        escolha_playlist = int(input("Digite o código da playlist que deseja atualizar: "))
        return escolha_playlist

    except Exception as e:
        print(f"Erro ao listar álbuns: {str(e)}")

    finally:
        conexao.close()

def Att_Playlist(escolha_playlist, insert_delete):
    if insert_delete == 1:
        List_Albuns_Faixas(escolha_playlist, 1)

    elif insert_delete == 2:
        delete_from_Playlist(escolha_playlist)


def delete_from_Playlist(id_playlist):
    delete_faixas = listar_faixas_da_playlist(id_playlist)
    conexao, cursor = conect_ao_banco()
    try:
        for id_faixa in delete_faixas:
            
            cursor.execute("DELETE FROM Playlist_Faixas WHERE playlist = ? AND faixa = ?", id_playlist, id_faixa)

        conexao.commit()
        print("Faixas removidas da playlist com sucesso!")

    except Exception as e:
        print(f"Erro ao remover faixas à playlist: {str(e)}")

    finally:
        conexao.close()


def listar_faixas_da_playlist(id_playlist):
    conexao, cursor = conect_ao_banco()

    try:
        cursor.execute("SELECT pf.faixa, f.desc_faixa FROM Playlist_Faixas pf JOIN Faixas f ON pf.faixa = f.id_faixa WHERE pf.playlist = ?", id_playlist)
        faixas = cursor.fetchall()

        if not faixas:
            print("A playlist não possui faixas.")
            return
        
        for faixa in faixas:
            print(f"{faixa.faixa}: {faixa.desc_faixa}")

        print("Escolha as faixas que deseja remover da playlist:")
        escolha_faixas = [int(x) for x in input("Digite os códigos das faixas separados por espaço: ").split()]
        
        return escolha_faixas

    except Exception as e:
        print(f"Erro ao listar faixas da playlist: {str(e)}")

    finally:
        conexao.close()

def exibir_menu():
    print(" _____             _  ______          ")
    print("/  ___|           | | | ___ \         ")
    print("\ `--. _ __   ___ | |_| |_/ /__ _ __  ")
    print(" `--. \ '_ \ / _ \| __|  __/ _ \ '__| ")
    print("/\__/ / |_) | (_) | |_| | |  __/ |    ")
    print("\____/| .__/ \___/ \__\_|  \___|_|    ")
    print("      | |                             ")
    print("      |_|                             ")
    print("O que deseja?")
    print("1) Criar uma nova Playlist")
    print("2) Atualizar Playlists existentes")
    print("3) Consultar dados do seu Spotper")
    print("4) Encerrar o SpotPer")

def menu():
    while True:
        exibir_menu()

        escolha = input("Opção: ")

        ###ITEM 1)
        if escolha == '1':
            nome_playlist = input("Escolha um nome para a sua Playlist :) ")
            id_playlist = int(input("Agora escolha um ID para a Playlist ;) "))
            criar_playlist(nome_playlist, id_playlist)

            adicionar_faixas = int(input("Deseja adicionar faixas à playlist agora 1): Sim 2: Não: "))
            List_Albuns_Faixas(id_playlist, adicionar_faixas)
            
        ###ITEM 2)
        elif escolha == '2':
            escolha_playlist = listar_playlists()
            insert_delete = int(input("O que deseja?\n 1) Inserir Faixas \n 2) Deletar Faixas: \n Opção: \n"))
            Att_Playlist(escolha_playlist, insert_delete)

        ##ITEM 3)   
        elif escolha == '3':
            while True:
                exibir_menu_opcao_3()

                subescolha = input("\nEscolha : ")

                if subescolha == '1':
                    Consulta_A()
                elif subescolha == '2':
                    Consulta_A()
                elif subescolha == '3':
                    Consulta_A()
                elif subescolha == '4':
                    Consulta_A()
                elif subescolha == '5':
                    break
                else:
                    print("Subopção inválida. Tente novamente.")

        elif escolha == '4':
            print("Saindo do programa. Até mais!")
            break

        else:
            print("Opção inválida. Tente novamente.")


##################### CONSULTAS ITEM 3 #####################3
def exibir_menu_opcao_3():
    print("\nQual consulta deseja realizar?")
    print("1: Listar os álbuns com preço de compra maior que a média de preços de compra de todos os álbuns.")
    print("2: Listar nome da gravadora com maior número de playlists que possuem pelo uma faixa composta pelo compositor Dvorack.")
    print("3: Listar nome do compositor com maior número de faixas nas playlists existentes")
    print("4: Listar playlists, cujas faixas (todas) têm tipo de composição “Concerto” e período “Barroco”")
    print("5: Voltar ao menu principal")

def Consulta_A():
    conexao, cursor = conect_ao_banco()

    try:
        #Colocar a consulta aqui
        cursor.execute("SELECT id_playlist, nome FROM Playlist")
        playlists = cursor.fetchall()

        #Exmp de formatação pra printar linha por linha
        for playlist in playlists:
            print(f"{playlist.id_playlist}: {playlist.nome}")
    
    except Exception as e:
        print(f"Erro ao executar a consulta SQL: {str(e)}")
    
    finally:
        conexao.close()

def Consulta_B():
    conexao, cursor = conect_ao_banco()

    try:
        #Colocar a consulta aqui
        cursor.execute("SELECT id_playlist, nome FROM Playlist")
        playlists = cursor.fetchall()

        #Exmp de formatação pra printar linha por linha
        for playlist in playlists:
            print(f"{playlist.id_playlist}: {playlist.nome}")
    
    except Exception as e:
        print(f"Erro ao executar a consulta SQL: {str(e)}")
    
    finally:
        conexao.close()

def Consulta_C():
    conexao, cursor = conect_ao_banco()

    try:
        #Colocar a consulta aqui
        cursor.execute("SELECT id_playlist, nome FROM Playlist")
        playlists = cursor.fetchall()

        #Exmp de formatação pra printar linha por linha
        for playlist in playlists:
            print(f"{playlist.id_playlist}: {playlist.nome}")
    
    except Exception as e:
        print(f"Erro ao executar a consulta SQL: {str(e)}")
    
    finally:
        conexao.close()

def Consulta_D():
    conexao, cursor = conect_ao_banco()

    try:
        #Colocar a consulta aqui
        cursor.execute("SELECT id_playlist, nome FROM Playlist")
        playlists = cursor.fetchall()

        #Exmp de formatação pra printar linha por linha
        for playlist in playlists:
            print(f"{playlist.id_playlist}: {playlist.nome}")
    
    except Exception as e:
        print(f"Erro ao executar a consulta SQL: {str(e)}")
    
    finally:
        conexao.close()

menu()

