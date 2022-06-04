


create table Loja(
idLoja int primary key auto_increment,
nomeLoja varchar(45),
fkCliente int,
foreign key (fkCliente) references Cliente (idCliente)
)auto_increment = 1000;
insert into Loja values (null, 'Carrefour Paulista', 160891),
                        (null, 'Carrefour Osasco', 160891),
                        (null, 'Carrefour Moema', 160891),
                        (null, 'Carrefour Luz', 160891);

create table localSensor(
idLocal int primary key auto_increment,
setor varchar(30),
movimentoEsperado int,
fkLoja int,
foreign key (fkLoja) references Loja (idLoja)
) auto_increment = 10000;
insert into localSensor values (null, 'Açougue', 100, 1000),
                               (null, 'Peixaria', 70, 1000),
                               (null, 'Adega', 40, 1000),
                               (null, 'Laticinios', '100', '1000'),
                               (null, 'Rotisseria', '70', '1000'),
                               (null, 'Ferramentas', '40', '1000'),
                               (null, 'Horti-Fruti', '100', '1000'),
                               (null, 'Enlatados', '70', '1000'),
                               (null, 'Eletronicos', '40', '1000');                              

create table Sensor(
idSensor int primary key auto_increment,
fkLocal int,
foreign key (fkLocal) references localSensor (idLocal)
) auto_increment = 100000;
insert into Sensor values (null, 10000),
                          (null, 10001),
                          (null, 10002),
                          (null, 10002),
                          (null, 10003),
                          (null, 10003),
                          (null, 10004),
                          (null, 10005),
                          (null, 10005),
                          (null, 10006),
                          (null, 10006),
                          (null, 10007),
                          (null, 10007),
                          (null, 10008),
                          (null, 10008);

create table medicao(
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor),
dataHora datetime,
primary key (fkSensor, dataHora),
dados char(1)
);
insert into medicao values (100000, '2022-03-05 09:01:10', 1),
						   (100000, '2022-03-05 09:01:30', 1),
						   (100000, '2022-03-05 09:02:30', 1),
						   (100002, '2022-03-05 09:01:30', 1),
						   (100002, '2022-03-05 09:20:30', 1),
						   (100004, '2022-03-05 10:30:40', 1),
						   (100005, '2022-03-05 11:15:40', 1),
						   (100006, '2022-03-05 12:53:40', 1);

create table Contato (
idContato int primary key auto_increment,
nome varchar(45),
email varchar(45),
empresa varchar(45),
celular char(11),
mensagem varchar(140)
);
insert into Contato values (null, 'Cremilda', 'cremilda@gmail.com', 'cremildashop', '11965765434', 'Gostaria de saber mais sobre o trabalho de vocês'),
                           (null, 'Jackscleyton', 'cleyton@gmail.com', 'jacksmarket', '11965545434', 'Gostaria de saber mais sobre o trabalho de vocês'),
                           (null, 'romildo', 'romildo@gmail.com', 'rominhoplace', '11969875434', 'Gostaria de saber mais sobre o trabalho de vocês');
                           
select * from Cliente;
select * from Usuario;
select * from Suporte;
select * from Loja;
select * from LocalSensor;
select * from Sensor;
select * from Medicao;
select * from Contato;

select * from Cliente, Usuario where fkCliente = idCliente;
select * from Usuario, Suporte where fkUsuario = idUsuario;
select * from Cliente, Loja where fkCliente = idCliente;
select * from Cliente, Loja, LocalSensor where fkCliente= idCliente and fkLoja = idLoja;
select * from Cliente, Loja, LocalSensor, Sensor where fkCliente= idCliente and fkLoja = idLoja and fkLocal = idLocal;
select * from Cliente, Loja, LocalSensor, Sensor, Medicao where fkCliente= idCliente and fkLoja = idLoja
and fkLocal = idLocal and fkSensor = idSensor;

select * from Cliente, Loja, LocalSensor, Sensor where fkCliente= idCliente and fkLoja = idLoja and fkLocal = idLocal and idCliente = 160891;