-- CRIANDO O BANCO
-- create user DSRPT identified by DSRPT;
-- grant connect, resource, dba to DSRPT;

-- TABELA CIDADE
CREATE TABLE cidade (
    id_cidade  NUMBER NOT NULL,
    nm_cidade  VARCHAR2(80) NOT NULL,
    id_pais    NUMBER NOT NULL
);
ALTER TABLE cidade ADD CONSTRAINT cidade_pk PRIMARY KEY ( id_cidade );
ALTER TABLE cidade ADD CONSTRAINT cidade_uk UNIQUE ( nm_cidade,
                                                     id_pais );


-- TABELA DIFICULDADE
CREATE TABLE dificuldade (
    id_dificuldade  NUMBER NOT NULL,
    nm_dificuldade  VARCHAR2(80) NOT NULL
);
ALTER TABLE dificuldade ADD CONSTRAINT dificuldade_pk PRIMARY KEY ( id_dificuldade );
ALTER TABLE dificuldade ADD CONSTRAINT dificuldade_uk UNIQUE ( nm_dificuldade );



-- TABELA ENIGMA
CREATE TABLE enigma (
    id_enigma          NUMBER NOT NULL,
    nm_enigma          VARCHAR2(80) NOT NULL,
    descricao          VARCHAR2(20) NOT NULL,
    ordem              NUMBER(38) NOT NULL,
    id_historia        NUMBER NOT NULL,
    id_enigma_origem   NUMBER,
    id_dificuldade     NUMBER NOT NULL,
    id_enigma_destino  NUMBER
);
CREATE UNIQUE INDEX enigma_o_idx ON
    enigma (
        id_enigma_origem
    ASC );
CREATE UNIQUE INDEX enigma_d_idx ON
    enigma (
        id_enigma_destino
    ASC );
ALTER TABLE enigma ADD CONSTRAINT enigma_pk PRIMARY KEY ( id_enigma );
ALTER TABLE enigma ADD CONSTRAINT enigma_o_d_uk UNIQUE ( id_enigma_origem,
                                                         id_enigma_destino );
ALTER TABLE enigma ADD CONSTRAINT enigma_uk UNIQUE ( nm_enigma,
                                                     id_historia );



-- TABELA FASE_JOGO
CREATE TABLE fase_jogo (
    id_fase_jogo  NUMBER NOT NULL,
    dt_inicio     DATE NOT NULL,
    dt_fim        DATE,
    id_jogo       NUMBER NOT NULL,
    id_enigma     NUMBER NOT NULL
);
ALTER TABLE fase_jogo ADD CONSTRAINT fase_jogo_pk PRIMARY KEY ( id_fase_jogo );
ALTER TABLE fase_jogo ADD CONSTRAINT fase_jogo_uk UNIQUE ( id_enigma,
                                                           id_jogo );



-- TABELA HISTORIA
CREATE TABLE historia (
    id_historia   NUMBER NOT NULL,
    nm_historia   VARCHAR2(80) NOT NULL,
    enredo        VARCHAR2(4000) NOT NULL,
    id_usuario    NUMBER NOT NULL,
    faixa_etaria  NUMBER
);
ALTER TABLE historia ADD CONSTRAINT historia_pk PRIMARY KEY ( id_historia );
ALTER TABLE historia ADD CONSTRAINT nm_historia_uk UNIQUE ( nm_historia );



-- TABELA IMAGEM
CREATE TABLE imagem (
    id_imagem  NUMBER NOT NULL,
    nm_imagem  VARCHAR2(80) NOT NULL,
    imagem     BLOB NOT NULL,
    id_enigma  NUMBER,
    id_pista   NUMBER,
    id_local   NUMBER
);
ALTER TABLE imagem ADD CONSTRAINT imagem_pk PRIMARY KEY ( id_imagem );
ALTER TABLE imagem ADD CONSTRAINT imagem_e_uk UNIQUE ( id_enigma );
ALTER TABLE imagem ADD CONSTRAINT imagem_l_uk UNIQUE ( id_local );
ALTER TABLE imagem ADD CONSTRAINT imagen_p_uk UNIQUE ( id_pista );




-- TABELA JOGO
CREATE TABLE jogo (
    id_jogo      NUMBER NOT NULL,
    id_usuario   NUMBER NOT NULL,
    id_historia  NUMBER NOT NULL,
    dt_inicio    DATE NOT NULL,
    dt_fim       DATE
);
ALTER TABLE jogo ADD CONSTRAINT jogo_pk PRIMARY KEY ( id_jogo );





-- TABELA LOCAL
CREATE TABLE local (
    id_local    NUMBER NOT NULL,
    nm_local    VARCHAR2(80) NOT NULL,
    descricao   VARCHAR2(20),
    coordenada  VARCHAR2(50),
    id_cidade   NUMBER NOT NULL
);
ALTER TABLE local ADD CONSTRAINT local_pk PRIMARY KEY ( id_local );
ALTER TABLE local ADD CONSTRAINT local_uk UNIQUE ( nm_local,
                                                   id_cidade );


-- TABELA PAIS
CREATE TABLE pais (
    id_pais  NUMBER NOT NULL,
    nm_pais  VARCHAR2(80) NOT NULL
);
ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );
ALTER TABLE pais ADD CONSTRAINT pais_nm_pais_un UNIQUE ( nm_pais );




-- TABELA PISTA
CREATE TABLE pista (
    id_pista          NUMBER NOT NULL,
    nm_pista          VARCHAR2(80) NOT NULL,
    pista             VARCHAR2(4000) NOT NULL,
    ordem             NUMBER,
    id_enigma         NUMBER NOT NULL,
    id_local_origem   NUMBER,
    id_local_destino  NUMBER
);
ALTER TABLE pista ADD CONSTRAINT pista_pk PRIMARY KEY ( id_pista );
ALTER TABLE pista ADD CONSTRAINT pista_uk UNIQUE ( nm_pista,
                                                   id_enigma );




-- TABLEA SOLUCAO
CREATE TABLE solucao (
    id_solucao       NUMBER NOT NULL,
    nm_solucao       VARCHAR2(80) NOT NULL,
    descricao        VARCHAR2(20) NOT NULL,
    resposta         VARCHAR2(20),
    id_enigma        NUMBER NOT NULL,
    id_tipo_solucao  NUMBER NOT NULL
);
ALTER TABLE solucao ADD CONSTRAINT solucao_pk PRIMARY KEY ( id_solucao );
ALTER TABLE solucao ADD CONSTRAINT solucao_uk UNIQUE ( id_enigma );


-- TABELA TIPO_SOLUCAO
CREATE TABLE tipo_solucao (
    id_tipo_solucao  NUMBER NOT NULL,
    nm_tipo_solucao  VARCHAR2(80) NOT NULL
);
ALTER TABLE tipo_solucao ADD CONSTRAINT tipo_solucao_pk PRIMARY KEY ( id_tipo_solucao );
ALTER TABLE tipo_solucao ADD CONSTRAINT tipo_solucao_uk UNIQUE ( nm_tipo_solucao );



-- TABELA TIPO_USUARIO
CREATE TABLE tipo_usuario (
    id_tipo_usuario  NUMBER NOT NULL,
    nm_tipo_usuario  VARCHAR2(20) NOT NULL
);
ALTER TABLE tipo_usuario ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY ( id_tipo_usuario );
ALTER TABLE tipo_usuario ADD CONSTRAINT tp_usuario_uk UNIQUE ( nm_tipo_usuario );


-- TABELA USUARIO
CREATE TABLE usuario (
    id_usuario       NUMBER NOT NULL,
    nm_usuario       VARCHAR2(80) NOT NULL,
    login            VARCHAR2(80) NOT NULL,
    senha            VARCHAR2(20) NOT NULL,
    id_tipo_usuario  NUMBER NOT NULL,
    sexo             CHAR(1) NOT NULL,
    dt_nascimento    DATE NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );
ALTER TABLE usuario ADD CONSTRAINT usuario_login_un UNIQUE ( login );
ALTER TABLE usuario ADD CONSTRAINT usuario_cc CHECK(sexo in('F', 'M'));


-- CONSTRAINTS
ALTER TABLE cidade
    ADD CONSTRAINT cidade_pais_fk FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE enigma
    ADD CONSTRAINT enigma_dificuldade_fk FOREIGN KEY ( id_dificuldade )
        REFERENCES dificuldade ( id_dificuldade );

ALTER TABLE enigma
    ADD CONSTRAINT enigma_enigma_fk FOREIGN KEY ( id_enigma_origem )
        REFERENCES enigma ( id_enigma );

ALTER TABLE enigma
    ADD CONSTRAINT enigma_enigma_fkv2 FOREIGN KEY ( id_enigma_destino )
        REFERENCES enigma ( id_enigma );

ALTER TABLE enigma
    ADD CONSTRAINT enigma_historia_fk FOREIGN KEY ( id_historia )
        REFERENCES historia ( id_historia );

ALTER TABLE fase_jogo
    ADD CONSTRAINT fase_jogo_enigma_fk FOREIGN KEY ( id_enigma )
        REFERENCES enigma ( id_enigma );

ALTER TABLE fase_jogo
    ADD CONSTRAINT fase_jogo_jogo_fk FOREIGN KEY ( id_jogo )
        REFERENCES jogo ( id_jogo );

ALTER TABLE historia
    ADD CONSTRAINT historia_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE imagem
    ADD CONSTRAINT imagem_enigma_fk FOREIGN KEY ( id_enigma )
        REFERENCES enigma ( id_enigma );

ALTER TABLE imagem
    ADD CONSTRAINT imagem_local_fk FOREIGN KEY ( id_local )
        REFERENCES local ( id_local );

ALTER TABLE imagem
    ADD CONSTRAINT imagem_pista_fk FOREIGN KEY ( id_pista )
        REFERENCES pista ( id_pista );

ALTER TABLE jogo
    ADD CONSTRAINT jogo_historia_fk FOREIGN KEY ( id_historia )
        REFERENCES historia ( id_historia );

ALTER TABLE jogo
    ADD CONSTRAINT jogo_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE local
    ADD CONSTRAINT local_cidade_fk FOREIGN KEY ( id_cidade )
        REFERENCES cidade ( id_cidade );

ALTER TABLE pista
    ADD CONSTRAINT pista_enigma_fk FOREIGN KEY ( id_enigma )
        REFERENCES enigma ( id_enigma );

ALTER TABLE pista
    ADD CONSTRAINT pista_local_d_fk FOREIGN KEY ( id_local_destino )
        REFERENCES local ( id_local );

ALTER TABLE pista
    ADD CONSTRAINT pista_local_o_fk FOREIGN KEY ( id_local_origem )
        REFERENCES local ( id_local );

ALTER TABLE solucao
    ADD CONSTRAINT solucao_enigma_fk FOREIGN KEY ( id_enigma )
        REFERENCES enigma ( id_enigma );

ALTER TABLE solucao
    ADD CONSTRAINT solucao_tipo_solucao_fk FOREIGN KEY ( id_tipo_solucao )
        REFERENCES tipo_solucao ( id_tipo_solucao );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY ( id_tipo_usuario )
        REFERENCES tipo_usuario ( id_tipo_usuario );



-- SEQUENCIAS E TRIGGERS PARA AUTO INCREMENTO
CREATE SEQUENCE cidade_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cidade_trg BEFORE
    INSERT ON cidade
    FOR EACH ROW
    WHEN ( new.id_cidade IS NULL )
BEGIN
    :new.id_cidade := cidade_seq.nextval;
END;
/

CREATE SEQUENCE dificuldade_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER dificuldade_trg BEFORE
    INSERT ON dificuldade
    FOR EACH ROW
    WHEN ( new.id_dificuldade IS NULL )
BEGIN
    :new.id_dificuldade := dificuldade_seq.nextval;
END;
/

CREATE SEQUENCE enigma_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER enigma_trg BEFORE
    INSERT ON enigma
    FOR EACH ROW
    WHEN ( new.id_enigma IS NULL )
BEGIN
    :new.id_enigma := enigma_seq.nextval;
END;
/

CREATE SEQUENCE fase_jogo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fase_jogo_trg BEFORE
    INSERT ON fase_jogo
    FOR EACH ROW
    WHEN ( new.id_fase_jogo IS NULL )
BEGIN
    :new.id_fase_jogo := fase_jogo_seq.nextval;
END;
/

CREATE SEQUENCE historia_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER historia_trg BEFORE
    INSERT ON historia
    FOR EACH ROW
    WHEN ( new.id_historia IS NULL )
BEGIN
    :new.id_historia := historia_seq.nextval;
END;
/

CREATE SEQUENCE imagem_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER imagem_trg BEFORE
    INSERT ON imagem
    FOR EACH ROW
    WHEN ( new.id_imagem IS NULL )
BEGIN
    :new.id_imagem := imagem_seq.nextval;
END;
/

CREATE SEQUENCE jogo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER jogo_trg BEFORE
    INSERT ON jogo
    FOR EACH ROW
    WHEN ( new.id_jogo IS NULL )
BEGIN
    :new.id_jogo := jogo_seq.nextval;
END;
/

CREATE SEQUENCE local_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER local_trg BEFORE
    INSERT ON local
    FOR EACH ROW
    WHEN ( new.id_local IS NULL )
BEGIN
    :new.id_local := local_seq.nextval;
END;
/

CREATE SEQUENCE pais_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pais_trg BEFORE
    INSERT ON pais
    FOR EACH ROW
    WHEN ( new.id_pais IS NULL )
BEGIN
    :new.id_pais := pais_seq.nextval;
END;
/

CREATE SEQUENCE pista_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pista_trg BEFORE
    INSERT ON pista
    FOR EACH ROW
    WHEN ( new.id_pista IS NULL )
BEGIN
    :new.id_pista := pista_seq.nextval;
END;
/

CREATE SEQUENCE solucao_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER solucao_trg BEFORE
    INSERT ON solucao
    FOR EACH ROW
    WHEN ( new.id_solucao IS NULL )
BEGIN
    :new.id_solucao := solucao_seq.nextval;
END;
/

CREATE SEQUENCE tipo_solucao_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_solucao_trg BEFORE
    INSERT ON tipo_solucao
    FOR EACH ROW
    WHEN ( new.id_tipo_solucao IS NULL )
BEGIN
    :new.id_tipo_solucao := tipo_solucao_seq.nextval;
END;
/

CREATE SEQUENCE tipo_usuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_usuario_trg BEFORE
    INSERT ON tipo_usuario
    FOR EACH ROW
    WHEN ( new.id_tipo_usuario IS NULL )
BEGIN
    :new.id_tipo_usuario := tipo_usuario_seq.nextval;
END;
/

CREATE SEQUENCE usuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usuario_trg BEFORE
    INSERT ON usuario
    FOR EACH ROW
    WHEN ( new.id_usuario IS NULL )
BEGIN
    :new.id_usuario := usuario_seq.nextval;
END;
/

