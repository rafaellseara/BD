CREATE USER 'admin'@'localhost' IDENTIFIED BY 'senha';

GRANT SELECT, INSERT, UPDATE, DELETE ON PISTA.* TO 'admin'@'localhost';

GRANT EXECUTE ON PROCEDURE PISTA.dados_cliente_do_caso 		TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.dados_prova_do_caso 		TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.dados_suspeito_do_caso 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_do_detetive 			TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.relatorios_do_detetive 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_do_cliente 			TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.detetives_estado_casos 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_classificacao 		TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.detetives_classificacao 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_data_a_data 			TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_data_a_data_fecho 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.maiores_clientes 			TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.clientes_classificacao 	TO 'admin'@'localhost';

GRANT EXECUTE ON PROCEDURE PISTA.adicionar_cliente 				TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_cliente_telefone 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_suspeito 			TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_caso 				TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_detetive 			TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_detetive_telefone 	TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_detetive_caso 		TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_prova 				TO 'admin'@'localhost';

GRANT SELECT ON PISTA.verDetetive 	TO 'admin'@'localhost';
GRANT SELECT ON PISTA.verCasos 		TO 'admin'@'localhost';
GRANT SELECT ON PISTA.verClientes 	TO 'admin'@'localhost';
GRANT SELECT ON PISTA.verSuspeitos 	TO 'admin'@'localhost';
GRANT SELECT ON PISTA.verProvas 	TO 'admin'@'localhost';





CREATE USER 'detetive'@'localhost' IDENTIFIED BY 'senha';

GRANT SELECT ON PISTA.Cliente 	TO 'detetive'@'localhost';
GRANT SELECT ON PISTA.Caso 		TO 'detetive'@'localhost';
GRANT SELECT ON PISTA.Suspeito 	TO 'detetive'@'localhost';
GRANT SELECT ON PISTA.Prova 	TO 'detetive'@'localhost';

GRANT EXECUTE ON PROCEDURE PISTA.dados_cliente_do_caso 		TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.dados_prova_do_caso 		TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.dados_suspeito_do_caso 	TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.relatorios_do_detetive 	TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_do_cliente 			TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_data_a_data 			TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.casos_data_a_data_fecho 	TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.maiores_clientes 			TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.clientes_classificacao 	TO 'detetive'@'localhost';

GRANT EXECUTE ON PROCEDURE PISTA.adicionar_suspeito 			TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_caso 				TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_detetive_telefone 	TO 'detetive'@'localhost';
GRANT EXECUTE ON PROCEDURE PISTA.adicionar_prova 				TO 'detetive'@'localhost';

GRANT SELECT ON PISTA.verCasos 		TO 'detetive'@'localhost';
GRANT SELECT ON PISTA.verClientes 	TO 'detetive'@'localhost';
GRANT SELECT ON PISTA.verSuspeitos 	TO 'detetive'@'localhost';
GRANT SELECT ON PISTA.verProvas 	TO 'detetive'@'localhost';
