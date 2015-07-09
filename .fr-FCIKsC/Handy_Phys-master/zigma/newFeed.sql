DELIMITER $$
CREATE PROCEDURE `newFeed`(in contenido text,in correo varchar(100))
begin
	declare idUser int;
	declare idFeed int;
	set idFeed = (select ifnull(max(idFeedback),0) + 1 from feedback);
	set idUser= (select idUsuario from usuarios inner join datos on datos.correo=usuarios.idDatos where datos.correo = correo);
	insert into feedback values(idFeed,idUser,contenido,current_timestamp);
end




