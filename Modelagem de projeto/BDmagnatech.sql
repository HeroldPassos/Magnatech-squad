create database magnatech;

use magnatech;


CREATE TABLE fazenda (
  idFazenda INT auto_increment,
  nome VARCHAR(40),
  razaoSocial VARCHAR(40) ,
  cnpj CHAR(14) ,
  email VARCHAR(45) ,
  telefoneCel CHAR(11) ,
  telefoneFixo char (10),
  rua VARCHAR(40) ,
  numero VARCHAR(40) ,
  bairro VARCHAR(40) ,
  cep CHAR(8) ,
  cidade VARCHAR(40) ,
  estado VARCHAR(40) ,
  PRIMARY KEY (idFazenda))
  ;




CREATE TABLE especieCogumelo (
  idCogumelo INT  ,
  espécie VARCHAR(45) not null,
  tempIdeal DECIMAL(4,2) ,
  umidIdeal DECIMAL(3,1) ,
  PRIMARY KEY (idCogumelo))
  ;




CREATE TABLE nicho (
  fkFazenda INT,
  idNicho INT,
  coluna VARCHAR(5),
  prateleira VARCHAR(5),
  fkCogumelo INT,
  PRIMARY KEY (idNicho, fkFazenda),
    FOREIGN KEY (fkFazenda)
    REFERENCES fazenda (idFazenda),
    FOREIGN KEY (fkCogumelo)
    REFERENCES especieCogumelo (idCogumelo))
    ;




CREATE TABLE Funcionario(
fkFazenda INT,
idFuncionario INT AUTO_INCREMENT,
PRIMARY KEY (idFuncionario, fkFazenda),
FOREIGN KEY (fkFazenda) REFERENCES fazenda(idFazenda),
senha VARCHAR(20),
nome VARCHAR(60),
celular CHAR(11),
email VARCHAR(60)
)AUTO_INCREMENT = 25220;




CREATE TABLE arduino (
  idSensor INT  ,
  sensor VARCHAR(5) ,
  fkNicho INT  ,
  fkFazenda INT  ,
  PRIMARY KEY (idSensor),
    FOREIGN KEY (fkNicho , fkFazenda)
    REFERENCES nicho (idNicho , fkFazenda)
    );


    CREATE TABLE Captura(
    fkArduino INT,
    idCaptura INT,
   PRIMARY KEY (fkArduino, idCaptura),
   FOREIGN KEY (fkArduino) REFERENCES arduino(idSensor),
   umidade DECIMAL(4,2),
	temperatura DECIMAL(4,2),
    momento DATETIME
    )  ;
    
    


CREATE TABLE agendamento (
  idagendamento INT auto_increment,
  fkFazenda INT ,
  nomeRepresentante VARCHAR(45) ,
  telefone CHAR(11) ,
  email VARCHAR(40) ,
  agendamentoData DATE ,
  nomeEmpresa VARCHAR(40) ,
  cnpj CHAR(14) ,
  rua VARCHAR(40) ,
  bairro VARCHAR(40) ,
  completemento VARCHAR(40) ,
  PRIMARY KEY (idagendamento, fkFazenda),
	FOREIGN KEY (fkFazenda)
    REFERENCES fazenda (idFazenda))
    auto_increment = 1000;



insert into fazenda (nome, razaoSocial, cnpj, email, telefoneCel, telefoneFixo, rua, numero, bairro, cep, cidade, estado) values
('nome Fazenda1','Razão Social fazenda1','07258852000118','fazenda1@gmail.com','11968188554','1168188554','rua 1','212','bairro 1','04455220','São Roque','São Paulo'),
('nome Fazenda2','Razão Social fazenda2','08258852000220','fazenda2@gmail.com','11955354585','1155127864','rua 2','415','bairro 2','03312550','são João de Mereti','Rio de Janeiro');

select * from fazenda;
desc funcionario;

insert into Funcionario (fkFazenda, senha, nome, celular, email) values 
(1,'senha11',' funcionario1 Fazenda1','11968488554','funcionario1@fazenda1.com'),
(2,'senha22',' Funcionario1 Fazenda2','21954525451','funcionario1@fazenda2.com'),
(1,'senha33',' Funcionario2 Fazenda1','11111111111','funcionario2@fazenda1.com'),
(2,'senha44',' Funcionario2 Fazenda2','22222222222','funcionario2@fazenda2.com');


select * from funcionario;

