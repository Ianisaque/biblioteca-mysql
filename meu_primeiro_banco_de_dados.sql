
-- =====================================================
-- ATIVIDADE PRÁTICA MYSQL
-- PROJETO: SISTEMA DE BIBLIOTECA
-- BANCO DE DADOS: biblioteca_meu
-- Ian Isaque Rabêlo Barros
-- =====================================================


-- 1. CRIAR E SELECIONAR O BANCO DE DADOS

CREATE DATABASE IF NOT EXISTS biblioteca_meu;

USE biblioteca_meu;


-- =====================================================
-- 2. CRIAR AS TABELAS
-- =====================================================

-- TABELA DE AUTORES

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    pais VARCHAR(60)
);


-- TABELA DE LIVROS

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    preco DECIMAL(8,2) NOT NULL,
    id_autor INT,

    CONSTRAINT fk_livros_autores
    FOREIGN KEY (id_autor)
    REFERENCES autores(id_autor)
);


-- =====================================================
-- 3. CADASTRAR AUTORES
-- =====================================================

INSERT INTO autores (nome, pais) VALUES
('Machado de Assis', 'Brasil'),
('Clarice Lispector', 'Brasil'),
('George Orwell', 'Reino Unido');


-- CONSULTAR AUTORES CADASTRADOS

SELECT * FROM autores;


-- =====================================================
-- 4. CADASTRAR LIVROS
-- =====================================================

INSERT INTO livros
(titulo, ano_publicacao, preco, id_autor)
VALUES
('Dom Casmurro', 1899, 39.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 42.50, 1),
('A Hora da Estrela', 1977, 35.00, 2),
('1984', 1949, 49.90, 3);


-- CONSULTAR LIVROS CADASTRADOS

SELECT * FROM livros;


-- =====================================================
-- 5. CONSULTAR LIVROS COM FILTRO E ORDENAÇÃO
-- =====================================================

SELECT titulo, ano_publicacao, preco
FROM livros
WHERE ano_publicacao >= 1900
ORDER BY preco DESC;


-- =====================================================
-- 6. CONSULTAR LIVROS E SEUS AUTORES (INNER JOIN)
-- =====================================================

SELECT
    l.titulo,
    a.nome AS autor,
    l.preco
FROM livros l
INNER JOIN autores a
ON l.id_autor = a.id_autor;


-- =====================================================
-- 7. ATUALIZAR PREÇOS DOS LIVROS
-- AUMENTAR 10% NOS LIVROS ABAIXO DE R$ 40,00
-- =====================================================

-- Desativar temporariamente o modo de atualização segura

SET SQL_SAFE_UPDATES = 0;


UPDATE livros
SET preco = ROUND(preco * 1.10, 2)
WHERE preco < 40.00;


-- Consultar preços atualizados

SELECT * FROM livros;


-- =====================================================
-- 8. EXCLUIR UM LIVRO PELO ID
-- =====================================================

DELETE FROM livros
WHERE id_livro = 3;


-- =====================================================
-- 9. CONSULTA FINAL DOS LIVROS
-- =====================================================

SELECT * FROM livros;


-- =====================================================
-- FIM DA ATIVIDADE PRÁTICA
-- =====================================================
