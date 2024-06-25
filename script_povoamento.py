import mysql.connector
import random
from datetime import datetime, timedelta

try:
    db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="pista"
    )

    cursor = db.cursor()

    nomes_masculinos = [
        "Bruno Costa", "Carlos Lima", "Eduardo Ferreira", "Gabriel Alves", "Igor Santos",
        "Lucas Teixeira", "Nuno Carvalho", "Pedro Gonçalves", "Quinta Soares", "Tiago Marques"
    ]

    nomes_femininos = [
        "Ana Silva", "Daniela Martins", "Fernanda Rocha", "Helena Pinto", "Joana Sousa",
        "Karla Mendes", "Mariana Ribeiro", "Olga Moreira", "Rita Campos", "Sara Lopes"
    ]

    empresas = [
        "TechSolutions", "InformaticaGlobal", "CodeMasters", "NetBuilders", "CyberTech",
        "DataInnovators", "SoftWareHouse", "TechiesUnited", "ITConsult", "DevOpsCorp"
    ]

    ruas = [
        "Rua dos Bares", "Rua da Universidade", "Rua de Informatica",
        "Rua do Enterro da Gata", "Rua do Bar Academico"
    ]

    def gerar_nif():
        return str(random.randint(100000000, 999999999))

    def gerar_cod_postal():
        return f"{random.randint(1000, 9999)}-{random.randint(100, 999)}"

    for _ in range(5):
        nome_completo_masculino = random.choice(nomes_masculinos)
        nomes_masculinos.remove(nome_completo_masculino)
        primeiro_nome_masculino, ultimo_nome_masculino = nome_completo_masculino.split()
        email_masculino = f"{primeiro_nome_masculino.lower()}@{ultimo_nome_masculino.lower()}.pt"
        tipo_masculino = "Singular"
        rua_masculino = random.choice(ruas)
        numero_masculino = str(random.randint(1, 150))
        cod_postal_masculino = gerar_cod_postal()
        sexo_masculino = "M"
        
        nif_masculino = gerar_nif()

        sql = "CALL adicionar_cliente(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        valores_masculino = (nif_masculino, nome_completo_masculino, email_masculino, tipo_masculino, rua_masculino, 0.0, 0.0, numero_masculino, cod_postal_masculino, sexo_masculino)
        
        cursor.execute(sql, valores_masculino)

        nome_completo_feminino = random.choice(nomes_femininos)
        nomes_femininos.remove(nome_completo_feminino)
        primeiro_nome_feminino, ultimo_nome_feminino = nome_completo_feminino.split()
        email_feminino = f"{primeiro_nome_feminino.lower()}@{ultimo_nome_feminino.lower()}.pt"
        tipo_feminino = "Singular"
        rua_feminino = random.choice(ruas)
        numero_feminino = str(random.randint(1, 150))
        cod_postal_feminino = gerar_cod_postal()
        sexo_feminino = "F"
        
        nif_feminino = gerar_nif()

        valores_feminino = (nif_feminino, nome_completo_feminino, email_feminino, tipo_feminino, rua_feminino, 0.0, 0.0, numero_feminino, cod_postal_feminino, sexo_feminino)
        
        cursor.execute(sql, valores_feminino)

    for _ in range(5):
        nome_empresa = random.choice(empresas)
        empresas.remove(nome_empresa)
        email_empresa = f"{nome_empresa.lower()}@lei.pt"
        tipo_empresa = "Coletivo"
        rua_empresa = random.choice(ruas)
        numero_empresa = str(random.randint(1, 150))
        cod_postal_empresa = gerar_cod_postal()
        sexo_empresa = "ND"  # Não definido
        
        nif_empresa = gerar_nif()

        valores_empresa = (nif_empresa, nome_empresa, email_empresa, tipo_empresa, rua_empresa, 0.0, 0.0, numero_empresa, cod_postal_empresa, sexo_empresa)
        
        cursor.execute(sql, valores_empresa)

    nomes = [
        "Alexandre Almeida", "Beatriz Barreto", "Catarina Carvalho", "Duarte Dias", "Elisa Esteves",
        "Fábio Ferreira", "Giovana Gomes", "Henrique Henriques", "Inês Inácio", "Jorge Jesus",
        "Larissa Lima", "Miguel Miranda", "Natália Neves", "Otávio Oliveira", "Paula Pereira",
        "Rafael Ribeiro", "Sofia Santos", "Tiago Tavares", "Ursula Uchoa", "Victor Vieira"
    ]

    def gerar_estado():
        return random.choice(["Ativo", "Inativo"])

    for _ in range(15):
        nome_completo = random.choice(nomes)
        nomes.remove(nome_completo)
        primeiro_nome, ultimo_nome = nome_completo.split()
        email = f"{primeiro_nome.lower()}@{ultimo_nome.lower()}.pt"
        estado = gerar_estado()

        sql = "CALL adicionar_detetive(%s, %s, %s, %s, %s)"
        valores = (nome_completo, email, 0, 0.0, estado)
        
        cursor.execute(sql, valores)

    nomes_suspeitos = [
        "André Amaral", "Bianca Barbosa", "Caio Carvalho", "Diana Dias", "Eduardo Esteves",
        "Fernanda Faria", "Gustavo Gomes", "Helena Henriques", "Isabel Inácio", "João Jesus",
        "Kátia Kastro", "Leonardo Lima", "Maria Miranda", "Nelson Neves", "Olívia Oliveira",
        "Paulo Pereira", "Quintina Queiroz", "Roberto Ribeiro", "Sônia Silva", "Tadeu Tavares"
    ]

    descricoes_suspeitos = [
        "Envolvido em atividades suspeitas na região central.",
        "Visto frequentemente em cenas de crime.",
        "Suspeito de envolvimento em tráfico de drogas.",
        "Histórico de assaltos a residências.",
        "Conhecido por falsificação de documentos.",
        "Possui antecedentes criminais por roubo.",
        "Associado a uma gangue local.",
        "Investigações apontam envolvimento em sequestros.",
        "Suspeito de fraudes financeiras.",
        "Visto com comportamentos suspeitos em áreas comerciais.",
        "Testemunhas relataram atitudes violentas.",
        "Envolvido em disputas territoriais.",
        "Suspeito de lavagem de dinheiro.",
        "Apareceu em diversas investigações de contrabando.",
        "Presença constante em locais de crimes não resolvidos.",
        "Histórico de violência doméstica.",
        "Envolvido em atividades de pirataria digital.",
        "Conhecido por extorsão e ameaças.",
        "Identificado em redes de prostituição.",
        "Envolvimento com atividades terroristas."
    ]

    for _ in range(20):
        nome = random.choice(nomes_suspeitos)
        nomes_suspeitos.remove(nome)
        descricao = random.choice(descricoes_suspeitos)
        descricoes_suspeitos.remove(descricao)

        sql = "CALL adicionar_suspeito(%s, %s)"
        valores = (nome, descricao)
        
        cursor.execute(sql, valores)

    def gerar_data_aleatoria(inicio, fim):
        delta = fim - inicio
        return inicio + timedelta(days=random.randint(0, delta.days))

    def gerar_preco():
        return round(random.uniform(100.00, 10000.00), 2)

    def gerar_classificacao():
        return round(random.uniform(0.00, 10.00), 2)

    data_inicio = datetime(2020, 1, 1)
    data_fim = datetime(2024, 12, 31)

    cursor.execute("SELECT NIF FROM cliente")
    nifs_clientes = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Id FROM suspeito")
    ids_suspeitos = [row[0] for row in cursor.fetchall()]

    for _ in range(20):
        descricao_caso = f"Descrição detalhada do caso {_ + 1}"
        data_abertura = gerar_data_aleatoria(data_inicio, data_fim)
        data_fecho = None
        data_escrita_relatorio = None
        classificacao = 0.0
        preco = gerar_preco()
        descricao_relatorio = f"Relatório do caso {_ + 1}" if data_escrita_relatorio else None
        cliente_nif = random.choice(nifs_clientes)
        suspeito_id = random.choice(ids_suspeitos)

        sql = """
            CALL adicionar_caso (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        valores = (
            'Fechado', descricao_caso, data_abertura, data_fecho, preco, classificacao, 
            data_escrita_relatorio, descricao_relatorio, cliente_nif, suspeito_id
        )
        
        cursor.execute(sql, valores)

    def gerar_data_aleatoria(data_inicio, data_fim):
        if data_fim is None or data_fim > datetime(2024, 12, 31):
            data_fim = datetime(2024, 12, 31)

        delta = (data_fim - data_inicio).days
        random_days = random.randint(0, delta)
        return data_inicio + timedelta(days=random_days)

    cursor.execute("SELECT Id FROM suspeito")
    ids_suspeitos = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Id FROM caso")
    ids_casos = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Id FROM detetive")
    ids_detetives = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Id, DataAbertura, DataFecho FROM caso")
    casos = cursor.fetchall()

    data_abertura_caso = {}
    data_fecho_caso = {}

    for caso in casos:
        caso_id = caso[0]
        data_abertura = caso[1]
        data_fecho = caso[2]
        data_abertura_caso[caso_id] = data_abertura
        data_fecho_caso[caso_id] = data_fecho if data_fecho else datetime(2024, 12, 31)

    for i in range(20):
        descricao = f"Descrição da prova {i + 1}"
        
        caso_id = random.choice(ids_casos)
        suspeito_id = random.choice(ids_suspeitos)
        
        data_inicio = data_abertura_caso[caso_id]
        data_fim = data_fecho_caso[caso_id] if data_fecho_caso[caso_id] else datetime(2024, 12, 31)
        
        data_descoberta = gerar_data_aleatoria(data_inicio, data_fim)

        detetive_id = random.choice(ids_detetives)

        sql = """
            CALL adicionar_prova(%s, %s, %s, %s, %s)
        """
        valores = (descricao, data_descoberta, suspeito_id, caso_id, detetive_id)
        
        cursor.execute(sql, valores)

    def gerar_telefone():
        return '253' + ''.join([str(random.randint(0, 9)) for _ in range(6)])

    cursor.execute("SELECT NIF FROM cliente")
    ids_clientes = [row[0] for row in cursor.fetchall()]

    for cliente_id in ids_clientes:
        for _ in range(2):
            telefone = gerar_telefone()
            
            sql = """
                CALL adicionar_cliente_telefone(%s, %s)
            """
            valores = (telefone, cliente_id)
            
            cursor.execute(sql, valores)
    
    cursor.execute("SELECT Id FROM detetive")
    ids_detetives = [row[0] for row in cursor.fetchall()]

    for detetive_id in ids_detetives:
        for _ in range(2):
            telefone = gerar_telefone()
            
            sql = """
                CALL adicionar_detetive_telefone(%s, %s)
            """
            valores = (telefone, detetive_id)
            
            cursor.execute(sql, valores)
    
    cursor.execute("SELECT Id FROM caso")
    ids_casos = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Id FROM detetive")
    ids_detetives = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT Id, DataAbertura, DataFecho FROM caso")
    casos = cursor.fetchall()

    cursor.execute("SELECT Id, Estado FROM detetive")
    detetives = cursor.fetchall()


    data_abertura_caso = {}
    data_fecho_caso = {}

    for caso in casos:
        caso_id = caso[0]
        data_abertura = caso[1]
        data_fecho = caso[2]
        data_abertura_caso[caso_id] = data_abertura
        data_fecho_caso[caso_id] = data_fecho if data_fecho else datetime(2024, 12, 31)

    for caso_id in ids_casos:
        detetives_ativos = [(detetive_id, estado) for detetive_id, estado in detetives if estado == 'Ativo']
        num_detetives = random.randint(2, 3)
        detetives_selecionados = random.sample(detetives_ativos, num_detetives)

        detetive_responsavel = detetives_selecionados[0][0] if detetives_selecionados else None

        for detetive_id, estado in detetives_selecionados:
            responsavel = 1 if detetive_id == detetive_responsavel else 0

            sql = """
                CALL adicionar_detetive_caso(%s, %s, %s)
            """
            valores = (detetive_id, caso_id, responsavel)
            
            cursor.execute(sql, valores)


    
    def obter_data_abertura(caso_id):
        query = "SELECT DataAbertura FROM Caso WHERE Id = %s"
        cursor.execute(query, (caso_id,))
        result = cursor.fetchone()
        return result[0] if result else None
    
    # Selecionar 5 casos aleatórios
    cursor.execute("SELECT Id FROM Caso")
    ids_casos = [row[0] for row in cursor.fetchall()]

    # Garantir que existam pelo menos 5 casos para selecionar
    if len(ids_casos) < 5:
        raise ValueError("Não existem casos suficientes para selecionar aleatoriamente.")

    casos_para_fechar = random.sample(ids_casos, 5)

    for caso_id in casos_para_fechar:
        classificacao = gerar_classificacao()  # Assumindo que esta função já está definida
        data_abertura = obter_data_abertura(caso_id)  # Função que retorna a data de abertura do caso

        if not data_abertura:
            raise ValueError(f"Data de abertura não encontrada para o caso {caso_id}")

        data_fecho = gerar_data_aleatoria(data_abertura, datetime(2024, 12, 31))  # Assumindo que esta função já está definida
        data_escrita_relatorio = data_fecho
        descricao_relatorio = f"Relatório do caso {caso_id}"

        sql = "CALL fechar_caso(%s, %s, %s, %s, %s)"
        valores = (caso_id, classificacao, data_fecho, data_escrita_relatorio, descricao_relatorio)

        cursor.execute(sql, valores)
    
    db.commit()
    cursor.close()
    db.close()

    print("Inserção completa.")

except mysql.connector.Error as error:
    print("Failed to connect to MySQL Server: {}".format(error))
    
finally:
    if db.is_connected():
        db.close()
        print("MySQL connection closed")

