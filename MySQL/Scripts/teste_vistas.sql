-- Seleção da base de dados
USE PISTA;

SELECT * FROM verDetetive;

SELECT * FROM verCasos;

SELECT * FROM verSuspeitos;

SELECT * FROM verClientes;

SELECT * FROM verProvas;

-- Teste para o procedimento dados_cliente_do_caso
CALL dados_cliente_do_caso(1);
-- Espera-se que retorne detalhes do cliente associado ao caso com ID 1.

-- Teste para o procedimento dados_prova_do_caso
CALL dados_prova_do_caso(1);
-- Espera-se que retorne detalhes da prova associada ao caso com ID 1.

-- Teste para o procedimento dados_suspeito_do_caso
CALL dados_suspeito_do_caso(1);
-- Espera-se que retorne detalhes do suspeito associado ao caso com ID 1.

-- Teste para o procedimento casos_do_detetive
CALL casos_do_detetive(1);
-- Espera-se que retorne todos os casos associados ao detetive com ID 1.

-- Teste para o procedimento relatorios_do_detetive
CALL relatorios_do_detetive(1);
-- Espera-se que retorne descrições dos relatórios de casos fechados associados ao detetive com ID 1.

-- Teste para o procedimento casos_do_cliente
CALL casos_do_cliente(1);
-- Espera-se que retorne todos os casos associados ao cliente com NIF 1.

-- Teste para o procedimento detetives_estado_casos
CALL detetives_estado_casos(5, 'Ativo');
-- Espera-se que retorne todos os detetives que têm 5 ou mais casos e estão ativos.

-- Teste para o procedimento casos_classificacao
CALL casos_classificacao();
-- Espera-se que retorne todos os casos ordenados por classificação.

-- Teste para o procedimento detetives_classificacao
CALL detetives_classificacao();
-- Espera-se que retorne todos os detetives ordenados por classificação.

-- Teste para o procedimento casos_data_a_data
CALL casos_data_a_data('2023-01-01', '2023-12-31');
-- Espera-se que retorne a contagem de casos abertos entre 1 de janeiro de 2023 e 31 de dezembro de 2023.

-- Teste para o procedimento casos_fechados_data_a_data
CALL casos_fechados_data_a_data('2023-01-01', '2023-12-31');
-- Espera-se que retorne a contagem de casos fechados entre 1 de janeiro de 2023 e 31 de dezembro de 2023.