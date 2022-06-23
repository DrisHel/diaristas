--Gerenciador de faxina para diarista.

DROP DATABASE IF EXISTS gerenciador;

CREATE DATABASE gerenciador;

\c gerenciador

CREATE TABLE diarista(
    id  serial primary key,
    cpf character(14) unique,
    nome character (100)
);

INSERT INTO diarista(cpf,nome) VALUES ('130.665.060-70','Gilda de Freitas');
INSERT INTO diarista(cpf,nome) VALUES ('510.510.510-96','Aline Barros ');
INSERT INTO diarista(cpf,nome) VALUES ('954.271.140-92','Madeleine dos Santos');
INSERT INTO diarista(cpf,nome) VALUES ('067.633.470-90','Marisa Monte');
INSERT INTO diarista(cpf,nome) VALUES ('593.249.100-00','Geovana Antonelli');
INSERT INTO diarista(cpf,nome) VALUES ('462.998.530-18','Maria Lima');
INSERT INTO diarista(cpf,nome) VALUES ('979.610.510-15','Roberta Miranda');
INSERT INTO diarista(cpf,nome) VALUES ('399.251.980-54','Isis Valverde');
INSERT INTO diarista(cpf,nome) VALUES ('477.707.000-00','Milene Marcos');
INSERT INTO diarista(cpf,nome) VALUES ('982.217.070-07','Angélica Huck');

select * from diarista;

CREATE TABLE tamanho(
  id serial primary key,
  descricao text,
  valor real
);


INSERT INTO tamanho(descricao,valor) VALUES ('5 comodos valor a partir de :',100.00);
INSERT INTO tamanho(descricao,valor) VALUES ('6 comodos valor a partir de :',150.00);
INSERT INTO tamanho(descricao,valor) VALUES ('7 comodos valor a partir de :',200.00);
INSERT INTO tamanho(descricao,valor) VALUES ('8 comodos ou mais a partir de :',250.00);

select * from tamanho;


CREATE TABLE responsavel(
    id serial primary key,
    cpf character(14) unique,
    nome character (100)
);

INSERT INTO responsavel(cpf,nome) VALUES ('038.606.500-41','Taylor Alison Swift');
INSERT INTO responsavel(cpf,nome) VALUES ('130.665.060-70','Luana Piovani');
INSERT INTO responsavel(cpf,nome) VALUES ('510.510.510-96','Amy Lee Hartzler');
INSERT INTO responsavel(cpf,nome) VALUES ('954.271.140-92','Avril Ramona Lavigne');
INSERT INTO responsavel(cpf,nome) VALUES ('067.633.470-90','Corey Todd Taylor ');
INSERT INTO responsavel(cpf,nome) VALUES ('593.249.100-00','Chad Kroeger');

select * from responsavel;

CREATE TABLE residencia(
    id serial primary key,
    cidade character(100),
    bairro character(100),
    rua character(100),
    numero int,
    complemento character(100),
    tamanho_id integer REFERENCES tamanho(id),
    responsavel_id integer REFERENCES responsavel(id)
);

INSERT INTO residencia(cidade,bairro,rua,numero,complemento,tamanho_id, responsavel_id) VALUES ('Rio Grande','Lar Gaúcho', 'Ernani Fornari',258,'casa A',1,3);
INSERT INTO residencia(cidade,bairro,rua,numero,complemento,tamanho_id, responsavel_id) VALUES ('Rio Grande','Centro', 'Guilherme Rauen ',700,'',2,2);
INSERT INTO residencia(cidade,bairro,rua,numero,complemento,tamanho_id, responsavel_id) VALUES ('Rio Grande','Nossa Senhora dos Navegantes', 'Nicolau Coelho',258,'casa 750',1,4);
INSERT INTO residencia(cidade,bairro,rua,numero,complemento,tamanho_id, responsavel_id) VALUES ('Rio Grande','Frederico Ernesto Buchholz', 'Avenida Argentina',258,'Ap 290A',3,6);
INSERT INTO residencia(cidade,bairro,rua,numero,complemento,tamanho_id, responsavel_id) VALUES ('Rio Grande','Cassino', 'Doutor Vaz Dias Júnior',500,'',4,1);
INSERT INTO residencia(cidade,bairro,rua,numero,complemento,tamanho_id, responsavel_id) VALUES ('Rio Grande','Senandes', 'Jornalista Armando Ferreira',1250,'',4,2);

select * from residencia;

CREATE TABLE faxina(
    id serial primary key,
    data DATE,
    preco_inicial REAL,
    preco_final real,
    realizada boolean,
    justificativa_valor text,
    feedback text,
    diarista_id integer not null REFERENCES diarista(id),
    residencia_id integer not null REFERENCES residencia (id)
);

select *from faxina;
