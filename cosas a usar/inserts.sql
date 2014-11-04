

INSERT INTO `boletapagodescuento` VALUES (1,20.00,1,'tp001'),(2,20.00,1,'tp001');



INSERT INTO `tiposdescuentos` VALUES ('tp001','Descuento del ISSS',0.070,'2014-01-01');
INSERT INTO `boletapago` VALUES (1,'enero',300.00,'emp01');


insert into departamento values('1','san salvador','el salvador');
insert into municipio values ('01','1','Soyapango');
INSERT INTO `oficina` VALUES ('ofi01','01','calidad','San Salvador');
INSERT INTO `genero` VALUES ('F','Femenino'),('M','Masculino');
INSERT INTO `puesto` VALUES (1,'contador','empleado','2014-10-10',30.00,40.00),(3,'Fianciera','empleado','2014-10-10',30.00,40.00);
INSERT INTO `empleado` VALUES ('emp01','1','ofi01','M',NULL,'12345','56789','Juan ','Perez','Perez','1983-12-12','2014-01-01',220.00,'asoi@gmail.com','2344-1212','A');