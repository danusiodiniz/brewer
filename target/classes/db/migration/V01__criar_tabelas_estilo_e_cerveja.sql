CREATE TABLE public.estilo
(
    codigo bigserial NOT NULL,
    nome character(50) NOT NULL,
    PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.estilo OWNER to postgres;


CREATE TABLE public.cerveja
(
    codigo bigserial NOT NULL,
    sku character(50) NOT NULL,
    nome character(50) NOT NULL,
    descricao text NOT NULL,
    valor numeric(10, 2) NOT NULL,
    teor_alcoolico numeric(10, 2) NOT NULL,
    comissao numeric(10, 2) NOT NULL,
    sabor character(50) NOT NULL,
    origem character(50) NOT NULL,
    codigo_estilo bigint NOT NULL,
    CONSTRAINT pk_cerveja PRIMARY KEY (codigo),
    CONSTRAINT fk_estilo FOREIGN KEY (codigo_estilo)
        REFERENCES public.estilo (codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.cerveja  OWNER to postgres;

INSERT INTO estilo (nome) VALUES ('Amber Lager');
INSERT INTO estilo (nome) VALUES ('Dark Lager');
INSERT INTO estilo (nome) VALUES ('Pale Lager');
INSERT INTO estilo (nome) VALUES ('Pilsner');