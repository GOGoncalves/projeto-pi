CREATE DATABASE TwoSense;

USE TwoSense;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY,
nomeResponsavel VARCHAR(45),
telefone CHAR(10),
email VARCHAR(45),
CNPJ CHAR(20),
logradouro VARCHAR(45),
numero INT,
complemento VARCHAR(45),
bairro VARCHAR(45),
cidade VARCHAR(45),
estado CHAR(2)
);

insert Cliente values (160891, 'Fernando Brands', 8645633318, 'brands@gmail.com', 23456789000123, 'rua guararapes', 191, null, 'Lapa', 'São Paulo', 'SP'); 

select * from cliente;

select * from usuario;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES Cliente(idCliente),
	nomeUsuario VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

select * from usuario;

CREATE TABLE Loja (
idLoja INT PRIMARY KEY AUTO_INCREMENT,
nomeLoja VARCHAR(45),
fkCliente INT,
FOREIGN KEY (fkCliente) REFERENCES Cliente(idcliente)
) AUTO_INCREMENT = 1000;

insert Loja values (null, 'Carrefour Paulista', '160891');

CREATE TABLE aquario (
	idAquario INT PRIMARY KEY AUTO_INCREMENT,
    fkLoja INT,
    FOREIGN KEY (fkLoja) REFERENCES Loja(idLoja)
);
insert aquario values (1, 1000);

/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

CREATE TABLE medida (
	idMedida INT PRIMARY KEY AUTO_INCREMENT,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(idAquario)
);

insert into medida values (1, 1, '2022-06-03 14:00:00',1),
							(2, 0, '2022-06-03 14:01:00',1),
                            (3, 0, '2022-06-03 14:02:00',1),
                            (4, 1, '2022-06-03 14:03:00',1);

select * from usuario;


update medida set fk_aquario = 1 where idMedida >= 1;

select sum(chave) as 'qtd medidas' from medida where '2022-06-03 13:00:00' and '2022-06-03 14:00:00';

select sum(chave), DATE_FORMAT(momento,'%H:%i:%s') as momento, fk_aquario 
		from medida 
			join aquario
				on fk_aquario = idAquario;
                
select sum(chave), DATE_FORMAT(momento, '%H:%i:%s') as momento_grafico, fk_Aquario
		from medida 
				join aquario
					on fk_Aquario = idAquario
		group by idMedida;


select * from medida;
        
SELECT sum(chave), momento
	FROM medida 
		WHERE momento > now() - INTERVAL 8 HOUR
			AND momento < now() - INTERVAL 7 HOUR;

CREATE TABLE tempPorHora
(
idTempPorHora INT PRIMARY KEY AUTO_INCREMENT,
chave BOOLEAN,
momento DATETIME
);



DELIMITER //
CREATE PROCEDURE mediaPorHora()
	BEGIN
		DECLARE i INT Default 24;
			TRUNCATE TABLE tempPorHora;
			
            loop_media : LOOP
            INSERT INTO tempPorHora (chave, momento) 
				SELECT sum(chave), momento
					FROM medida 
						WHERE momento > now() - INTERVAL i HOUR
							AND momento < now() - INTERVAL i-1 HOUR;
				SET i = i - 1;
            IF i = 0 THEN
				LEAVE loop_media;
			END IF;
		END LOOP loop_media;
        SELECT sum(chave) FROM tempPorHora;
END //

DELIMITER $$
CREATE PROCEDURE grafico()
	BEGIN
		