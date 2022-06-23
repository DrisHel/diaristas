--Gerenciador de faxina para diarista.
-- Implemente no PostgreSQL o B.D projetado no Modelo Relacional (construa um script.sql)
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

INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-23',100,150,'true','Acrescido R$50,00 devido quantidade de espelhos e vidros','Limpeza impecável',2,1);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-24',150,180,'true','Acrescido R$30,00 por ter limpado a casinha do pet','Atenciosa e responsável',9,11);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-27',200,350.80,'true','Acrescido R$150,80 devido ter chego antes do horário combinado','Diarista cupriu com o solicitado e se dispos ir antes do horário previamente combinado, devido um imprevisto que ocorreu comigo.',3,5);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-28',150,100.50,'true','Descontado R$49,50 devido ter quebrado um espelho da sala','Limpeza bem feita, porém precisa ter um pouco mais de cuidado com espelhos',6,14);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-28',350,500,'true','Acrescido R$150,00 pois limpou a garagem que não foi incluida inicialmente no pedido','Limpeza impecável, super indico',7,2);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-30',100,100,'true','','',4,16);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-30',400,430.60,'true','Acrescido R$30,60 devido finalizar antes do previsto','Limpeza impecável, extremamente organizada e rápida.',1,13);
INSERT INTO faxina(data, preco_inicial,preco_final,realizada,justificativa_valor,feedback,diarista_id,residencia_id) VALUES('2022-06-27',100,0,'false','Não compareceu, atestado!','',5,12);

select * from faxina;

--Crie um STORE PROCEDURE que permita agendar quinzenalmente ou mensalmente faxinas em uma determinada residência:
--A diarista e a residência devem ser considerados parâmetros de entrada
--É possível utilizar uma data limite (ex: até 31/12 do ano atual)
--É possível utilizar uma quantidade máxima de agendamentos (ex: marcar 30 faxinas mensalmente)

--CREATE FUNCTION agendamentos(text, text) RETURNS char AS
--$$
--DECLARE
 --resultado text;
--BEGIN
 --resultado := $1 || $2;
 --return resultado;
--END;
--$$ LANGUAGE 'plpgsql';


--Crie um STORE PROCEDURE que calcule a porcentagem de presenças que uma diarista obteve em suas faxinas ao longo do ano:
--Ex: 75% de presença
--Crie uma TRIGGER que exclua a diarista caso suas presenças fiquem menores que 75% (quando a diarista já tem no mínimo 5 faxinas cadastradas)