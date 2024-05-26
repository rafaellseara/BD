-- Seleção da base de dados
USE PISTA;

SELECT * FROM verDetetive;

SELECT * FROM verCasos;

SELECT * FROM verSuspeitos;

SELECT * FROM verClientes;

SELECT * FROM verProvasPorCasos;

SELECT * FROM ClientesPorCaso;

SELECT * FROM ProvasPorDetetive;

SELECT * FROM SuspeitosPorDetetive;

SELECT * FROM CasosPorDetetive;

SELECT * FROM RelatoriosPorDetetive;

SELECT * FROM CasosPorCliente;

SELECT * FROM DetetivesPorEstadoCasos;

SELECT * FROM ClientesPorClassificacaoMedia;

SELECT * FROM ClientesQueMaisGastam;

SELECT * FROM CasosRegistadosPorIntervalo;

SELECT * FROM CasosFechadosPorIntervalo;

SELECT * FROM CasosAbertosPorIntervalo;

SELECT * FROM ClassificacaoDetetives;

SELECT * FROM ProvasPorDetetive 
	WHERE DetetiveNome = 'Detetive A';

SELECT * FROM SuspeitosPorDetetive 
	WHERE DetetiveNome = 'Detetive A';
    
SELECT * FROM CasosPorCliente
	WHERE ClienteNome = "Maria Oliveira";