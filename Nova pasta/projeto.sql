/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10/12/2017 15:20:52                          */
/*==============================================================*/


alter table BILHETE
   drop constraint FK_BILHETE_INHERITAN_CARTAO;

alter table CARTAO
   drop constraint FK_CARTAO_POSSUI_UTILIZAD;

alter table CARTAO
   drop constraint FK_CARTAO_TEM_TIPO_CAR;

alter table CARTAO
   drop constraint FK_CARTAO_VENDE_LOJA_ONL;

alter table COMPRA_CARTAO
   drop constraint FK_COMPRA_C_COMPRA_CA_UTILIZA2;

alter table COMPRA_CARTAO
   drop constraint FK_COMPRA_C_COMPRA_CA_LOJA_ONL;

alter table COMPRA_CARTAO
   drop constraint FK_COMPRA_C_COMPRA_CA_CARTAO;

alter table COMPRA_CARTAO2
   drop constraint FK_COMPRA_C_COMPRA_CA_UTILIZAD;

alter table COMPRA_CARTAO2
   drop constraint FK_COMPRA_C_COMPRA_CA_LOJA_ON2;

alter table COMPRA_CARTAO2
   drop constraint FK_COMPRA_C_COMPRA_CA_CARTAO2;

alter table LOGIN
   drop constraint FK_LOGIN_RELATIONS_UTILIZAD;

alter table LOGIN
   drop constraint FK_LOGIN_RELATIONS_LOJA_ONL;

alter table LOJA_ONLINE
   drop constraint FK_LOJA_ONL_RELATIONS_LOGIN;

alter table NFC
   drop constraint FK_NFC_INHERITAN_CARTAO;

alter table PASSE
   drop constraint FK_PASSE_INHERITAN_CARTAO;

drop table BILHETE cascade constraints;

drop index VENDE_FK;

drop index TEM_FK;

drop index POSSUI_FK;

drop table CARTAO cascade constraints;

drop index COMPRA_CARTAO3_FK;

drop index COMPRA_CARTAO2_FK;

drop index COMPRA_CARTAO_FK;

drop table COMPRA_CARTAO cascade constraints;

drop index COMPRA_CARTAO6_FK;

drop index COMPRA_CARTAO5_FK;

drop index COMPRA_CARTAO4_FK;

drop table COMPRA_CARTAO2 cascade constraints;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_5_FK;

drop table LOGIN cascade constraints;

drop index RELATIONSHIP_7_FK;

drop table LOJA_ONLINE cascade constraints;

drop table NFC cascade constraints;

drop table PASSE cascade constraints;

drop table TIPO_CARTAO cascade constraints;

drop table UTILIZADOR cascade constraints;

/*==============================================================*/
/* Table: BILHETE                                               */
/*==============================================================*/
create table BILHETE 
(
   ID_PRODUTO           NUMBER               not null,
   N_BILHETE            VARCHAR2(5),
   constraint PK_BILHETE primary key (ID_PRODUTO)
);

/*==============================================================*/
/* Table: CARTAO                                                */
/*==============================================================*/
create table CARTAO 
(
   ID_PRODUTO           NUMBER               not null,
   COD_TIPO             NUMBER(5),
   BI                   INTEGER,
   ID_LOJA              NUMBER(5)            not null,
   DESCONTOS            NUMBER(5),
   N_VIAGENS            INTEGER,
   constraint PK_CARTAO primary key (ID_PRODUTO)
);

/*==============================================================*/
/* Index: POSSUI_FK                                             */
/*==============================================================*/
create index POSSUI_FK on CARTAO (
   BI ASC
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create index TEM_FK on CARTAO (
   COD_TIPO ASC
);

/*==============================================================*/
/* Index: VENDE_FK                                              */
/*==============================================================*/
create index VENDE_FK on CARTAO (
   ID_LOJA ASC
);

/*==============================================================*/
/* Table: COMPRA_CARTAO                                         */
/*==============================================================*/
create table COMPRA_CARTAO 
(
   BI                   INTEGER              not null,
   ID_LOJA              NUMBER(5)            not null,
   ID_PRODUTO           NUMBER               not null,
   DATA_COMPRA_CARTAO   DATE,
   constraint PK_COMPRA_CARTAO primary key (BI, ID_LOJA, ID_PRODUTO)
);

/*==============================================================*/
/* Index: COMPRA_CARTAO_FK                                      */
/*==============================================================*/
create index COMPRA_CARTAO_FK on COMPRA_CARTAO (
   BI ASC
);

/*==============================================================*/
/* Index: COMPRA_CARTAO2_FK                                     */
/*==============================================================*/
create index COMPRA_CARTAO2_FK on COMPRA_CARTAO (
   ID_LOJA ASC
);

/*==============================================================*/
/* Index: COMPRA_CARTAO3_FK                                     */
/*==============================================================*/
create index COMPRA_CARTAO3_FK on COMPRA_CARTAO (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Table: COMPRA_CARTAO2                                        */
/*==============================================================*/
create table COMPRA_CARTAO2 
(
   BI                   INTEGER              not null,
   ID_LOJA              NUMBER(5)            not null,
   ID_PRODUTO           NUMBER               not null,
   DATA_VIAGENS         DATE,
   constraint PK_COMPRA_CARTAO2 primary key (BI, ID_LOJA, ID_PRODUTO)
);

/*==============================================================*/
/* Index: COMPRA_CARTAO4_FK                                     */
/*==============================================================*/
create index COMPRA_CARTAO4_FK on COMPRA_CARTAO2 (
   BI ASC
);

/*==============================================================*/
/* Index: COMPRA_CARTAO5_FK                                     */
/*==============================================================*/
create index COMPRA_CARTAO5_FK on COMPRA_CARTAO2 (
   ID_LOJA ASC
);

/*==============================================================*/
/* Index: COMPRA_CARTAO6_FK                                     */
/*==============================================================*/
create index COMPRA_CARTAO6_FK on COMPRA_CARTAO2 (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Table: LOGIN                                                 */
/*==============================================================*/
create table LOGIN 
(
   BI                   INTEGER              not null,
   ID_LOJA              NUMBER(5)            not null,
   PASSWORD             VARCHAR2(5),
   RECUPERA_CONTA       VARCHAR2(5),
   constraint PK_LOGIN primary key (BI, ID_LOJA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on LOGIN (
   BI ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on LOGIN (
   ID_LOJA ASC
);

/*==============================================================*/
/* Table: LOJA_ONLINE                                           */
/*==============================================================*/
create table LOJA_ONLINE 
(
   TABELAS_DE_PRECO     INTEGER,
   ID_LOJA              NUMBER(5)            not null,
   BI                   INTEGER,
   LOG_ID_LOJA          NUMBER(5),
   METODO_DE_PAGAMENTO  VARCHAR2(5),
   constraint PK_LOJA_ONLINE primary key (ID_LOJA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on LOJA_ONLINE (
   BI ASC,
   LOG_ID_LOJA ASC
);

/*==============================================================*/
/* Table: NFC                                                   */
/*==============================================================*/
create table NFC 
(
   ID_PRODUTO           NUMBER               not null,
   N_NFC                VARCHAR2(5),
   constraint PK_NFC primary key (ID_PRODUTO)
);

/*==============================================================*/
/* Table: PASSE                                                 */
/*==============================================================*/
create table PASSE 
(
   ID_PRODUTO           NUMBER               not null,
   N_PASSE              VARCHAR2(5),
   constraint PK_PASSE primary key (ID_PRODUTO)
);

/*==============================================================*/
/* Table: TIPO_CARTAO                                           */
/*==============================================================*/
create table TIPO_CARTAO 
(
   COD_TIPO             NUMBER(5)            not null,
   TIPO_CARTAO          VARCHAR2(5),
   constraint PK_TIPO_CARTAO primary key (COD_TIPO)
);

/*==============================================================*/
/* Table: UTILIZADOR                                            */
/*==============================================================*/
create table UTILIZADOR 
(
   BI                   INTEGER              not null,
   NOME                 CLOB,
   NSS                  INTEGER,
   NIF                  INTEGER,
   IDADE                NUMBER               not null,
   SEXO                 VARCHAR2(5),
   E_MAIL               VARCHAR2(5),
   PASSWORD             VARCHAR2(5),
   RUA                  VARCHAR2(5),
   CODIGO_POSTAL        VARCHAR2(5),
   CIDADE               VARCHAR2(5),
   constraint PK_UTILIZADOR primary key (BI)
);

alter table BILHETE
   add constraint FK_BILHETE_INHERITAN_CARTAO foreign key (ID_PRODUTO)
      references CARTAO (ID_PRODUTO);

alter table CARTAO
   add constraint FK_CARTAO_POSSUI_UTILIZAD foreign key (BI)
      references UTILIZADOR (BI);

alter table CARTAO
   add constraint FK_CARTAO_TEM_TIPO_CAR foreign key (COD_TIPO)
      references TIPO_CARTAO (COD_TIPO);

alter table CARTAO
   add constraint FK_CARTAO_VENDE_LOJA_ONL foreign key (ID_LOJA)
      references LOJA_ONLINE (ID_LOJA);

alter table COMPRA_CARTAO
   add constraint FK_COMPRA_C_COMPRA_CA_UTILIZA2 foreign key (BI)
      references UTILIZADOR (BI);

alter table COMPRA_CARTAO
   add constraint FK_COMPRA_C_COMPRA_CA_LOJA_ONL foreign key (ID_LOJA)
      references LOJA_ONLINE (ID_LOJA);

alter table COMPRA_CARTAO
   add constraint FK_COMPRA_C_COMPRA_CA_CARTAO foreign key (ID_PRODUTO)
      references CARTAO (ID_PRODUTO);

alter table COMPRA_CARTAO2
   add constraint FK_COMPRA_C_COMPRA_CA_UTILIZAD foreign key (BI)
      references UTILIZADOR (BI);

alter table COMPRA_CARTAO2
   add constraint FK_COMPRA_C_COMPRA_CA_LOJA_ON2 foreign key (ID_LOJA)
      references LOJA_ONLINE (ID_LOJA);

alter table COMPRA_CARTAO2
   add constraint FK_COMPRA_C_COMPRA_CA_CARTAO2 foreign key (ID_PRODUTO)
      references CARTAO (ID_PRODUTO);

alter table LOGIN
   add constraint FK_LOGIN_RELATIONS_UTILIZAD foreign key (BI)
      references UTILIZADOR (BI);

alter table LOGIN
   add constraint FK_LOGIN_RELATIONS_LOJA_ONL foreign key (ID_LOJA)
      references LOJA_ONLINE (ID_LOJA);

alter table LOJA_ONLINE
   add constraint FK_LOJA_ONL_RELATIONS_LOGIN foreign key (BI, LOG_ID_LOJA)
      references LOGIN (BI, ID_LOJA);

alter table NFC
   add constraint FK_NFC_INHERITAN_CARTAO foreign key (ID_PRODUTO)
      references CARTAO (ID_PRODUTO);

alter table PASSE
   add constraint FK_PASSE_INHERITAN_CARTAO foreign key (ID_PRODUTO)
      references CARTAO (ID_PRODUTO);

