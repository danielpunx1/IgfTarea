/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     03/11/2014 10:52:06 a.m.                     */
/*==============================================================*/


drop table if exists AUDITORIA;

drop table if exists BOLETAPAGO;

drop table if exists BOLETAPAGODESCUENTO;

drop table if exists DEPARTAMENTO;

drop table if exists EMPLEADO;

drop table if exists GENERO;

drop table if exists MUNICIPIO;

drop table if exists OFICINA;

drop table if exists PUESTO;

drop table if exists TIPOSDESCUENTOS;

/*==============================================================*/
/* Table: AUDITORIA                                             */
/*==============================================================*/
create table AUDITORIA
(
   ID                   int not null auto_increment,
   TABLA                varchar(40),
   CRUD                 varchar(30),
   USUARIO              varchar(50),
   FECHA                datetime,
   primary key (ID)
);

/*==============================================================*/
/* Table: BOLETAPAGO                                            */
/*==============================================================*/
create table BOLETAPAGO
(
   ID_BOLETAPAGO        smallint not null,
   ID_EMPLEADO          varchar(5),
   PERIODO_PAGO         varchar(25) not null,
   SUELDO_NETO          decimal(10,2) not null,
   primary key (ID_BOLETAPAGO)
);

/*==============================================================*/
/* Table: BOLETAPAGODESCUENTO                                   */
/*==============================================================*/
create table BOLETAPAGODESCUENTO
(
   ID_BOLETAPAGODESCUENTO int not null,
   ID_BOLETAPAGO        smallint,
   ID_TIPOSDESCUENTOS   varchar(5),
   MONTO_DESCUENTO      decimal(11,2),
   primary key (ID_BOLETAPAGODESCUENTO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO
(
   ID_DEPTO             varchar(2) not null,
   NOMBRE_DEPTO         varchar(25) not null,
   ZONA_GEOGRAFICA      varchar(15) not null,
   primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   ID_EMPLEADO          varchar(5) not null,
   ID_PUESTO            smallint,
   ID_OFICINA           varchar(5),
   ID_SEXO              varchar(1),
   ID_JEFE              varchar(5),
   NIT                  varchar(14) not null,
   DUI                  varchar(45) not null,
   NOMBRES              varchar(45) not null,
   APELLIDO_PAT         varchar(45) not null,
   APELLIDO_MAT         varchar(45) not null,
   FECHA_NACIMIENTO     date not null,
   FECHA_INGRESO        date not null,
   SUELDO               decimal(11,2) not null,
   EMAIL                varchar(45),
   TELEFONO             varchar(45) not null,
   ACTIVO               varchar(1),
   primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO
(
   ID_SEXO              varchar(1) not null,
   D_SEXO               varchar(12) not null,
   primary key (ID_SEXO)
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO
(
   ID_MUNICIPIO         varchar(2) not null,
   ID_DEPTO             varchar(2),
   NOMB_MUNICIPIO       varchar(25) not null,
   primary key (ID_MUNICIPIO)
);

/*==============================================================*/
/* Table: OFICINA                                               */
/*==============================================================*/
create table OFICINA
(
   ID_OFICINA           varchar(5) not null,
   ID_MUNICIPIO         varchar(2),
   NOMB_OFICINA         varchar(45) not null,
   DOMICILIO            varchar(100),
   primary key (ID_OFICINA)
);

/*==============================================================*/
/* Table: PUESTO                                                */
/*==============================================================*/
create table PUESTO
(
   ID_PUESTO            smallint not null,
   NOMB_PUESTO          varchar(45) not null,
   PERFIL_PUESTO        varchar(255) not null,
   FECHA_ING            date not null,
   SUELDO_MIN           decimal(11,2),
   SUELDO_MAX           decimal(11,2),
   primary key (ID_PUESTO)
);

/*==============================================================*/
/* Table: TIPOSDESCUENTOS                                       */
/*==============================================================*/
create table TIPOSDESCUENTOS
(
   ID_TIPOSDESCUENTOS   varchar(5) not null,
   DESCRIPCION          varchar(250),
   PORCENTAJE_DESCUENTO decimal(5,3),
   FECHA_INGRESO        date not null,
   primary key (ID_TIPOSDESCUENTOS)
);

alter table BOLETAPAGO add constraint FK_RELATIONSHIP_5 foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table BOLETAPAGODESCUENTO add constraint FK_RELATIONSHIP_8 foreign key (ID_BOLETAPAGO)
      references BOLETAPAGO (ID_BOLETAPAGO) on delete restrict on update restrict;

alter table BOLETAPAGODESCUENTO add constraint FK_RELATIONSHIP_9 foreign key (ID_TIPOSDESCUENTOS)
      references TIPOSDESCUENTOS (ID_TIPOSDESCUENTOS) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_RELATIONSHIP_1 foreign key (ID_PUESTO)
      references PUESTO (ID_PUESTO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_RELATIONSHIP_2 foreign key (ID_OFICINA)
      references OFICINA (ID_OFICINA) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_RELATIONSHIP_3 foreign key (ID_SEXO)
      references GENERO (ID_SEXO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_RELATIONSHIP_4 foreign key (ID_JEFE)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table MUNICIPIO add constraint FK_RELATIONSHIP_7 foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO) on delete restrict on update restrict;

alter table OFICINA add constraint FK_RELATIONSHIP_6 foreign key (ID_MUNICIPIO)
      references MUNICIPIO (ID_MUNICIPIO) on delete restrict on update restrict;

