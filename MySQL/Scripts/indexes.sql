-- Indices
-- Indices Cliente
CREATE INDEX idx_cliente_email ON Cliente (Email);
CREATE INDEX idx_cliente_nome ON Cliente (Nome);


-- Indices Suspeito
CREATE INDEX idx_suspeito_nome ON Suspeito (Nome);

-- Indices  Caso 
CREATE INDEX idx_caso_cliente ON Caso (Cliente);
CREATE INDEX idx_caso_suspeito ON Caso (Suspeito);
CREATE INDEX idx_caso_dataabertura ON Caso (DataAbertura);
CREATE INDEX idx_caso_estado ON Caso (Estado);



-- Indices Prova
CREATE INDEX idx_prova_suspeito ON Prova (Suspeito);
CREATE INDEX idx_prova_caso ON Prova (Caso);
CREATE INDEX idx_prova_detetive ON Prova (Detetive)
    
