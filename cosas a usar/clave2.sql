/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     03/11/2014 10:52:06 a.m.                     */
/*==============================================================*/


drop table if exists auditoria;

drop table if exists boletapago;

drop table if exists boletapagodescuento;

drop table if exists departamento;

drop table if exists empleado;

drop table if exists genero;

drop table if exists municipio;

drop table if exists oficina;

drop table if exists puesto;

drop table if exists tiposdescuentos;

/*==============================================================*/
/* table: auditoria                                             */
/*==============================================================*/
create table auditoria
(
   id                   int not null auto_increment,
   tabla                varchar(40),
   crud                 varchar(30),
   usuario              varchar(50),
   fecha                datetime,
   primary key (id)
);

/*==============================================================*/
/* table: boletapago                                            */
/*==============================================================*/
create table boletapago
(
   id_boletapago        smallint not null AUTO_INCREMENT,
   id_empleado          varchar(5),
   periodo_pago         varchar(25) not null,
   sueldo_neto          decimal(10,2) not null,
   primary key (id_boletapago)
);

/*==============================================================*/
/* table: boletapagodescuento                                   */
/*==============================================================*/
create table boletapagodescuento
(
   id_boletapagodescuento int not null,
   id_boletapago        smallint,
   id_tiposdescuentos   varchar(5),
   monto_descuento      decimal(11,2),
   primary key (id_boletapagodescuento)
);

/*==============================================================*/
/* table: departamento                                          */
/*==============================================================*/
create table departamento
(
   id_depto             varchar(2) not null,
   nombre_depto         varchar(25) not null,
   zona_geografica      varchar(15) not null,
   primary key (id_depto)
);

/*==============================================================*/
/* table: empleado                                              */
/*==============================================================*/
create table empleado
(
   id_empleado          varchar(5) not null,
   id_puesto            smallint,
   id_oficina           varchar(5),
   id_sexo              varchar(1),
   id_jefe              varchar(5),
   nit                  varchar(14) not null,
   dui                  varchar(45) not null,
   nombres              varchar(45) not null,
   apellido_pat         varchar(45) not null,
   apellido_mat         varchar(45) not null,
   fecha_nacimiento     date not null,
   fecha_ingreso        date not null,
   sueldo               decimal(11,2) not null,
   email                varchar(45),
   telefono             varchar(45) not null,
   activo               varchar(1),
   primary key (id_empleado)
);

/*==============================================================*/
/* table: genero                                                */
/*==============================================================*/
create table genero
(
   id_sexo              varchar(1) not null,
   d_sexo               varchar(12) not null,
   primary key (id_sexo)
);

/*==============================================================*/
/* table: municipio                                             */
/*==============================================================*/
create table municipio
(
   id_municipio         varchar(2) not null,
   id_depto             varchar(2),
   nomb_municipio       varchar(25) not null,
   primary key (id_municipio)
);

/*==============================================================*/
/* table: oficina                                               */
/*==============================================================*/
create table oficina
(
   id_oficina           varchar(5) not null,
   id_municipio         varchar(2),
   nomb_oficina         varchar(45) not null,
   domicilio            varchar(100),
   primary key (id_oficina)
);

/*==============================================================*/
/* table: puesto                                                */
/*==============================================================*/
create table puesto
(
   id_puesto            smallint NOT NULL AUTO_INCREMENT,
   nomb_puesto          varchar(45) not null,
   perfil_puesto        varchar(255) not null,
   fecha_ing            date not null,
   sueldo_min           decimal(11,2),
   sueldo_max           decimal(11,2),
   primary key (id_puesto)
);

/*==============================================================*/
/* table: tiposdescuentos                                       */
/*==============================================================*/
create table tiposdescuentos
(
   id_tiposdescuentos   varchar(5) not null,
   descripcion          varchar(250),
   porcentaje_descuento decimal(5,3),
   fecha_ingreso        date not null,
   primary key (id_tiposdescuentos)
);

alter table boletapago add constraint fk_relationship_5 foreign key (id_empleado)
      references empleado (id_empleado) on delete restrict on update restrict;

alter table boletapagodescuento add constraint fk_relationship_8 foreign key (id_boletapago)
      references boletapago (id_boletapago) on delete restrict on update restrict;

alter table boletapagodescuento add constraint fk_relationship_9 foreign key (id_tiposdescuentos)
      references tiposdescuentos (id_tiposdescuentos) on delete restrict on update restrict;

alter table empleado add constraint fk_relationship_1 foreign key (id_puesto)
      references puesto (id_puesto) on delete restrict on update restrict;

alter table empleado add constraint fk_relationship_2 foreign key (id_oficina)
      references oficina (id_oficina) on delete restrict on update restrict;

alter table empleado add constraint fk_relationship_3 foreign key (id_sexo)
      references genero (id_sexo) on delete restrict on update restrict;

alter table empleado add constraint fk_relationship_4 foreign key (id_jefe)
      references empleado (id_empleado) on delete restrict on update restrict;

alter table municipio add constraint fk_relationship_7 foreign key (id_depto)
      references departamento (id_depto) on delete restrict on update restrict;

alter table oficina add constraint fk_relationship_6 foreign key (id_municipio)
      references municipio (id_municipio) on delete restrict on update restrict;

