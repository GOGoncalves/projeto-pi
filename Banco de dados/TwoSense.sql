create DATABASE TwoSense;

USE TwoSense;

create table Cliente (
idCliente int primary key,
nomeResponsavel varchar(45),
telefone char(10),
email varchar(45),
CNPJ char(20),
logradouro varchar(45),
numero int,
complemento varchar(45),
bairro varchar(45),
cidade varchar(45),
estado char(2)
);

insert Cliente values (160891, 'Fernando Brands', 8645633318, 'brands@gmail.com', 23456789000123, 'rua guararapes', 191, null, 'Lapa', 'São Paulo', 'SP'); 

select * from cliente;

select * from usuario;

create TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkCliente int,
    foreign key (fkCliente) references Cliente(idCliente),
	nomeUsuario VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

select * from usuario;
create table Loja (
idLoja int primary key auto_increment,
nomeLoja varchar(45),
fkCliente int,
foreign key (fkCliente) references Cliente(idcliente)
) auto_increment = 1000;

insert Loja values (null, 'Carrefour Paulista', '160891');

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	idAquario INT PRIMARY KEY AUTO_INCREMENT,
    fkLoja int,
    foreign key (fkLoja) references Loja(idLoja)
);
insert aquario values (1, 1000);

/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

create table medida (
	idMedida INT PRIMARY KEY AUTO_INCREMENT,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(idAquario)
);

select * from usuario;
select * from medida;
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
        
select * from usuario
