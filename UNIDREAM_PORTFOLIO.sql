DROP DATABASE IF EXISTS FACULDADE_UNIDREAM;
CREATE DATABASE FACULDADE_UNIDREAM;
USE FACULDADE_UNIDREAM;

CREATE TABLE TBL_PAIS (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE TBL_ESTADO (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(2),
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES TBL_PAIS(id_pais)
) ENGINE=InnoDB;

CREATE TABLE TBL_CIDADE (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES TBL_ESTADO(id_estado)
) ENGINE=InnoDB;

CREATE TABLE TBL_COORDENADOR (
    id_coordenador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    cpf VARCHAR (14) NOT NULL,
    data_nascimento DATE NOT NULL,
    salario FLOAT NOT NULL,
    data_admissao DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE TBL_EMAIL_COORDENADOR (
    id_email_coordenador INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    id_coordenador INT NOT NULL,
    FOREIGN KEY (id_coordenador) REFERENCES TBL_COORDENADOR (id_coordenador)
) ENGINE=InnoDB;

CREATE TABLE TBL_TELEFONE_COORDENADOR (
    id_telefone_coordenador INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR (20) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    id_coordenador INT NOT NULL,
    FOREIGN KEY (id_coordenador) REFERENCES TBL_COORDENADOR (id_coordenador)
) ENGINE=InnoDB;

CREATE TABLE TBL_ENDERECO_COORDENADOR (
    id_endereco_coordenador INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    cep VARCHAR(10) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    id_cidade INT NOT NULL,
    id_coordenador INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES TBL_CIDADE(id_cidade),
    FOREIGN KEY (id_coordenador) REFERENCES TBL_COORDENADOR (id_coordenador)
) ENGINE=InnoDB;

 CREATE TABLE TBL_CURSO (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    modalidade VARCHAR (45) NOT NULL,
    carga_horaria_total DECIMAL (10,2) NOT NULL,
    duracao_semestre INT NOT NULL,
    id_coordenador INT,
    FOREIGN KEY (id_coordenador) REFERENCES TBL_COORDENADOR(id_coordenador)
) ENGINE=InnoDB;

CREATE TABLE TBL_ALUNO (
	RA INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (200) NOT NULL,
    cpf VARCHAR (15) NOT NULL,
    email VARCHAR (300) NOT NULL,
    telefone VARCHAR (15),
    data_nascimento DATE NOT NULL,
    status_aluno VARCHAR (45) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES TBL_CURSO (id_curso)
) ENGINE=InnoDB;


CREATE TABLE TBL_EMAIL_ALUNO (
    id_email_aluno INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    RA INT NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA)
) ENGINE=InnoDB;

CREATE TABLE TBL_TELEFONE_ALUNO (
    id_telefone_aluno INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    RA INT NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA)
) ENGINE=InnoDB;

CREATE TABLE TBL_ENDERECO_ALUNO (
    id_endereco_aluno INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    cep VARCHAR(10) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    id_cidade INT NOT NULL,
    RA INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES TBL_CIDADE (id_cidade),
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA)
) ENGINE=InnoDB;

CREATE TABLE TBL_PROFESSOR (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    cpf VARCHAR (14) NOT NULL,
    titulo VARCHAR (50) NOT NULL,
    data_nascimento DATE NOT NULL,
    salario FLOAT NOT NULL,
    data_admissao DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE TBL_EMAIL_PROFESSOR (
    id_email_professor INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES TBL_PROFESSOR (id_professor)
) ENGINE=InnoDB;

CREATE TABLE TBL_TELEFONE_PROFESSOR (
    id_telefone_professor INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR (20) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES TBL_PROFESSOR (id_professor)
) ENGINE=InnoDB;

CREATE TABLE TBL_ENDERECO_PROFESSOR (
    id_endereco_professor INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    cep VARCHAR(10) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    id_cidade INT NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES TBL_CIDADE (id_cidade),
    FOREIGN KEY (id_professor) REFERENCES TBL_PROFESSOR (id_professor)
) ENGINE=InnoDB;

CREATE TABLE TBL_LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editora VARCHAR(100),
    isbn VARCHAR(20),
    ano_publicacao INT
) ENGINE=InnoDB;

CREATE TABLE TBL_EMPRESTIMO_LIVRO (
    id_emprestimo_livro INT PRIMARY KEY AUTO_INCREMENT,
    RA INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    devolucao BOOLEAN NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA),
    FOREIGN KEY (id_livro) REFERENCES TBL_LIVRO (id_livro)
) ENGINE=InnoDB;

CREATE TABLE TBL_FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (200) NOT NULL,
    cargo VARCHAR (100) NOT NULL,
    departamento VARCHAR (100)NOT NULL,
    login VARCHAR (100)
) ENGINE=InnoDB;

CREATE TABLE TBL_FINANCEIRO_MENSALIDADE (
    id_financeiro_mensalidade INT AUTO_INCREMENT PRIMARY KEY,
    RA INT NOT NULL,
    vencimento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    situacao VARCHAR (50) NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA)
) ENGINE=InnoDB;

CREATE TABLE TBL_EMPRESA_ESTAGIO (
    id_empresa_estagio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    cnpj VARCHAR (30) NOT NULL,
    ramo VARCHAR (45),
    contato VARCHAR (20)
) ENGINE=InnoDB;

CREATE TABLE TBL_ESTAGIO_SUPERVISIONADO (
    id_estagio INT AUTO_INCREMENT PRIMARY KEY,
    RA INT NOT NULL,
    id_empresa_estagio INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    carga_horaria DECIMAL (10,2) NOT NULL,
    status_estagio VARCHAR (30) NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA),
    FOREIGN KEY (id_empresa_estagio) REFERENCES TBL_EMPRESA_ESTAGIO (id_empresa_estagio)
) ENGINE=InnoDB;

CREATE TABLE TBL_MATRICULA (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    RA INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATE NOT NULL,
    situacao ENUM ('Ativa', 'Trancada', 'Cancelada', 'Concluída') NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA),
    FOREIGN KEY (id_curso) REFERENCES TBL_CURSO (id_curso)
) ENGINE=InnoDB;

CREATE TABLE TBL_DISCIPLINA (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    carga_horaria DECIMAL (10,2) NOT NULL,
    tipo VARCHAR (50) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES TBL_CURSO (id_curso)
) ENGINE=InnoDB;

CREATE TABLE TBL_AULA (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    semestre VARCHAR(10) NOT NULL,
    horario VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES TBL_DISCIPLINA (id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES TBL_PROFESSOR (id_professor)
) ENGINE=InnoDB;

CREATE TABLE TBL_AVALIACAO_NOTA (
    id_avaliacao_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    data_avaliacao DATE NOT NULL,
	tipo VARCHAR (100) NOT NULL,
    peso VARCHAR (50) NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES TBL_MATRICULA (id_matricula),
    FOREIGN KEY (id_disciplina) REFERENCES TBL_DISCIPLINA (id_disciplina)
) ENGINE=InnoDB;

CREATE TABLE TBL_USUARIO_SISTEMA (
	id_usuario_sistema INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR (200) NOT NULL,
    senha VARCHAR (200) NOT NULL,
    tipo VARCHAR (100) NOT NULL,
    id_referenciado VARCHAR (45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE TBL_FREQUENCIA (
	id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
    data_frequencia DATE NOT NULL,
    presenca BOOLEAN NOT NULL,
    id_matricula INT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES TBL_MATRICULA (id_matricula)
) ENGINE=InnoDB;

CREATE TABLE TBL_SALA (
	id_sala INT PRIMARY KEY AUTO_INCREMENT,
    bloco INT NOT NULL,
    numero INT NOT NULL,
    capacidade INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE TBL_TURMA (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    semestre VARCHAR (20) NOT NULL,
    turno VARCHAR (20) NOT NULL,
    ano INT NOT NULL,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    id_sala INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES TBL_DISCIPLINA (id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES TBL_PROFESSOR (id_professor),
    FOREIGN KEY (id_sala) REFERENCES TBL_SALA (id_sala)
) ENGINE=InnoDB;

CREATE TABLE TBL_HISTORICO_ESCOLAR (
    id_historico_escolar INT AUTO_INCREMENT PRIMARY KEY,
    RA INT NOT NULL,
    id_disciplina INT NOT NULL,
    ano YEAR NOT NULL,
    semestre VARCHAR (20) NOT NULL,
    nota_final DECIMAL(4,2),
    status_historico_escolar VARCHAR (20) NOT NULL,
    FOREIGN KEY (RA) REFERENCES TBL_ALUNO (RA),
    FOREIGN KEY (id_disciplina) REFERENCES TBL_DISCIPLINA (id_disciplina)
) ENGINE=InnoDB;

INSERT INTO TBL_PAIS (nome) VALUES 
('Brasil'),
('Argentina'),
('Chile');

INSERT INTO TBL_ESTADO (nome, sigla, id_pais) VALUES 
('São Paulo', 'SP', 1),
('Rio de Janeiro', 'RJ', 1),
('Buenos Aires', 'BA', 2);

INSERT INTO TBL_CIDADE (nome, id_estado) VALUES 
('São Paulo', 1),
('Campinas', 1),
('Rio de Janeiro', 2);

INSERT INTO TBL_COORDENADOR (nome, cpf, data_nascimento, salario, data_admissao) VALUES 
('Carlos Silva', '123.456.789-01', '1980-05-15', 8500.00, '2015-03-10'),
('Ana Oliveira', '987.654.321-09', '1975-11-22', 9200.00, '2018-07-20'),
('Pedro Santos', '456.789.123-45', '1985-02-28', 7800.00, '2020-01-05');

INSERT INTO TBL_EMAIL_COORDENADOR (email, id_coordenador) VALUES 
('carlos.silva@unidream.edu.com.br', 1),
('ana.oliveira@unidream.edu.com.br', 2),
('pedro.santos@unidream.edu.com.br', 3);

INSERT INTO TBL_TELEFONE_COORDENADOR (tipo, numero, id_coordenador) VALUES 
('Celular', '(11) 99999-8888', 1),
('Residencial', '(11) 3333-4444', 1),
('Celular', '(21) 98888-7777', 2),
('celular', '(21) 99999-9999', 3);

INSERT INTO TBL_ENDERECO_COORDENADOR (logradouro, numero, cep, bairro, complemento, id_cidade, id_coordenador) VALUES 
('Av. Paulista', '1000', '01310-100', 'Bela Vista', 'Apto 101', 1, 1),
('Rua da Paz', '45', '13050-000', 'Centro', 'Casa 2', 2, 2),
('Rua Copacabana', '200', '22050-000', 'Copacabana', 'Bloco B', 3, 3);

INSERT INTO TBL_CURSO (nome, modalidade, carga_horaria_total, id_coordenador) VALUES 
('Ciência da Computação', 'Presencial', 3200.00, 1),
('Administração', 'Presencial', 2800.00, 2),
('Engenharia Civil', 'Presencial', 3600.00, 3);

DESCRIBE TBL_CURSO;
ALTER TABLE TBL_CURSO DROP COLUMN duracao_semestre;

INSERT INTO TBL_ALUNO (nome, cpf, email, telefone, data_nascimento, status_aluno, id_curso) VALUES 
('João Pereira', '111.222.333-44', 'joaop@gmail.com', '(11) 99999-1111', '2000-01-10', 'Ativo', 1),
('Maria Souza', '222.333.444-55', 'maria.s@outlook.com', '(11) 98888-2222', '1999-05-20', 'Ativo', 2),
('Lucas Oliveira', '333.444.555-66', 'lucas.o@gmail.com', '(11) 97777-3333', '2001-03-15', 'Ativo', 3);

INSERT INTO TBL_EMAIL_ALUNO (email, RA) VALUES 
('joao.p@aluno.unidream.edu.com.br', 1),
('maria.s@aluno.unidream.edu.com.br', 2),
('lucas.o@aluno.unidream.edu.com.br', 3);

INSERT INTO TBL_TELEFONE_ALUNO (tipo, numero, RA) VALUES 
('Celular', '(11) 99999-1111', 1),
('Celular', '(11) 98888-2222', 2),
('Celular', '(11) 97777-3333', 3);

INSERT INTO TBL_ENDERECO_ALUNO (logradouro, numero, cep, bairro, complemento, id_cidade, RA) VALUES 
('Rua das Dores', '123', '01234-000', 'Jardim Paulista', 'Apto 302', 1, 1),
('Av. Brasil', '456', '04567-000', 'Moema', 'Casa 5', 1, 2),
('Rua dos Paulistas', '789', '07890-000', 'Morumbi', 'Bloco C', 1, 3);

INSERT INTO TBL_PROFESSOR (nome, cpf, titulo, data_nascimento, salario, data_admissao) VALUES 
('Roberto Almeida', '555.666.777-88', 'Doutor', '1970-08-12', 12000.00, '2010-02-15'),
('Fernanda Costa', '666.777.888-99', 'Mestre', '1980-04-25', 9500.00, '2015-08-20'),
('Marcos Ribeiro', '777.888.999-00', 'Doutor', '1975-11-30', 11000.00, '2012-03-10');

INSERT INTO TBL_EMAIL_PROFESSOR (email, id_professor) VALUES 
('roberto.almeida@unidream.edu.com.br', 1),
('fernanda.costa@unidream.edu.com.br', 2),
('marcos.ribeiro@unidream.edu.com.br', 3);

INSERT INTO TBL_TELEFONE_PROFESSOR (tipo, numero, id_professor) VALUES 
('Celular', '(11) 97777-5555', 1),
('Celular', '(11) 96666-4444', 2),
('Celular', '(11) 95555-3333', 3);

INSERT INTO TBL_ENDERECO_PROFESSOR (logradouro, numero, cep, bairro, complemento, id_cidade, id_professor) VALUES 
('Av. Angélica', '500', '01234-000', 'Higienópolis', 'Apto 801', 1, 1),
('Rua Augusta', '600', '01305-000', 'Consolação', 'Apto 502', 1, 2),
('Alameda Santos Dumont', '700', '01418-000', 'Cerqueira César', 'Apto 303', 1, 3);

INSERT INTO TBL_LIVRO (titulo, autor, editora, isbn, ano_publicacao) VALUES 
('Introdução à Programação', 'Deitel', 'Pearson', '978-85-352-1586-1', 2016),
('Banco de Dados', 'Elmasri', 'Pearson', '978-85-7605-443-1', 2011),
('Engenharia de Software', 'Pressman', 'McGraw-Hill', '978-85-7726-001-6', 2016);

INSERT INTO TBL_FUNCIONARIO (nome, cargo, departamento, login) VALUES 
('Antônio Gomes', 'Secretário', 'Secretaria', 'antonio.gomes'),
('Beatriz Lima', 'Bibliotecária', 'Biblioteca', 'beatriz.lima'),
('Cláudio Santos', 'Técnico', 'TI', 'claudio.santos');

INSERT INTO TBL_EMPRESA_ESTAGIO (nome, cnpj, ramo, contato) VALUES 
('Tech Solutions', '12.345.678/0001-90', 'Tecnologia', '(11) 3333-1111'),
('Admin Corp', '23.456.789/0001-80', 'Administração', '(11) 3333-2222'),
('Engenharia Ltda', '34.567.890/0001-70', 'Engenharia', '(11) 3333-3333');

INSERT INTO TBL_DISCIPLINA (nome, carga_horaria, tipo, id_curso) VALUES 
('Programação I', 80.00, 'Obrigatória', 1),
('Gestão Financeira', 60.00, 'Obrigatória', 2),
('Cálculo I', 90.00, 'Obrigatória', 3);

INSERT INTO TBL_SALA (bloco, numero, capacidade) VALUES 
(1, 101, 30),
(1, 102, 40),
(2, 201, 25);

INSERT INTO TBL_TURMA (semestre, turno, ano, id_disciplina, id_professor, id_sala) VALUES 
('1/2023', 'Matutino', 2023, 1, 1, 1),
('1/2023', 'Noturno', 2023, 2, 2, 2),
('2/2023', 'Vespertino', 2023, 3, 3, 3);

INSERT INTO TBL_MATRICULA (RA, id_curso, data_matricula, situacao) VALUES 
(1, 1, '2023-01-10', 'Ativa'),
(2, 2, '2023-01-11', 'Ativa'),
(3, 3, '2023-01-12', 'Ativa');

INSERT INTO TBL_AULA (id_disciplina, id_professor, semestre, horario) VALUES 
(1, 1, '1/2023', '08:00-10:00'),
(2, 2, '1/2023', '19:00-21:00'),
(3, 3, '2/2023', '14:00-16:00');

INSERT INTO TBL_AVALIACAO_NOTA (id_matricula, id_disciplina, nota, data_avaliacao, tipo, peso) VALUES 
(1, 1, 8.5, '2023-04-15', 'Prova', '50%'),
(2, 2, 7.0, '2023-04-16', 'Prova', '50%'),
(3, 3, 9.0, '2023-04-17', 'Prova', '50%');

INSERT INTO TBL_FREQUENCIA (data_frequencia, presenca, id_matricula) VALUES 
('2023-03-01', TRUE, 1),
('2023-03-02', TRUE, 2),
('2023-03-03', FALSE, 3);

INSERT INTO TBL_HISTORICO_ESCOLAR (RA, id_disciplina, ano, semestre, nota_final, status_historico_escolar) VALUES 
(1, 1, 2023, '1/2023', 8.5, 'Aprovado'),
(2, 2, 2023, '1/2023', 7.0, 'Aprovado'),
(3, 3, 2023, '2/2023', 9.0, 'Aprovado');

INSERT INTO TBL_EMPRESTIMO_LIVRO (RA, id_livro, data_emprestimo, data_devolucao, devolucao) VALUES 
(1, 1, '2023-03-01', '2023-03-15', TRUE),
(2, 2, '2023-03-02', '2023-03-16', TRUE),
(3, 3, '2023-03-03', '2023-03-17', FALSE);

INSERT INTO TBL_FINANCEIRO_MENSALIDADE (RA, vencimento, valor, situacao) VALUES 
(1, '2023-03-10', 850.00, 'Paga'),
(2, '2023-03-10', 750.00, 'Paga'),
(3, '2023-03-10', 950.00, 'Pendente');

INSERT INTO TBL_ESTAGIO_SUPERVISIONADO (RA, id_empresa_estagio, data_inicio, data_fim, carga_horaria, status_estagio) VALUES 
(1, 1, '2023-02-01', '2023-06-30', 240.00, 'Concluído'),
(2, 2, '2023-02-15', '2023-07-15', 240.00, 'Em andamento'),
(3, 3, '2023-03-01', NULL, 240.00, 'Em andamento');

INSERT INTO TBL_USUARIO_SISTEMA (login, senha, tipo, id_referenciado) VALUES 
('admin', 'admin123', 'Administrador', '0'),
('coordenador1', 'coord123', 'Coordenador', '1'),
('professor1', 'prof123', 'Professor', '1');

SELECT * FROM TBL_PAIS;
SELECT * FROM TBL_ESTADO;
SELECT * FROM TBL_CIDADE;

SELECT * FROM TBL_COORDENADOR;
SELECT * FROM TBL_EMAIL_COORDENADOR;
SELECT * FROM TBL_TELEFONE_COORDENADOR;
SELECT * FROM TBL_ENDERECO_COORDENADOR;

SELECT * FROM TBL_CURSO;

SELECT * FROM TBL_ALUNO;
SELECT * FROM TBL_EMAIL_ALUNO;
SELECT * FROM TBL_TELEFONE_ALUNO;
SELECT * FROM TBL_ENDERECO_ALUNO;
SELECT * FROM TBL_MATRICULA;

SELECT * FROM TBL_PROFESSOR;
SELECT * FROM TBL_EMAIL_PROFESSOR;
SELECT * FROM TBL_TELEFONE_PROFESSOR;
SELECT * FROM TBL_ENDERECO_PROFESSOR;

SELECT * FROM TBL_DISCIPLINA;
SELECT * FROM TBL_AULA;
SELECT * FROM TBL_TURMA;
SELECT * FROM TBL_SALA;
SELECT * FROM TBL_AVALIACAO_NOTA;
SELECT * FROM TBL_FREQUENCIA;
SELECT * FROM TBL_HISTORICO_ESCOLAR;

SELECT * FROM TBL_LIVRO;
SELECT * FROM TBL_EMPRESTIMO_LIVRO;

SELECT * FROM TBL_FUNCIONARIO;
SELECT * FROM TBL_FINANCEIRO_MENSALIDADE;
SELECT * FROM TBL_EMPRESA_ESTAGIO;
SELECT * FROM TBL_ESTAGIO_SUPERVISIONADO;

SELECT * FROM TBL_USUARIO_SISTEMA;
