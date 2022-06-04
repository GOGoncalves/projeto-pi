USE TwoSense;

SHOW VARIABLES LIKE "event%";

SET GLOBAL event_scheduler = ON;
DESC Usuario;



SELECT * FROM Usuario;
UPDATE Usuario
	SET sobrenomeUsuario = 'Gonçalves'
		WHERE idUSuario = 1;
		


CREATE EVENT teste
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
INSERT INTO Usuario VALUES
(null, 160891, 'Gian', 'gian.angelosp@gmail.com', 'email')
BEGIN 
	