
-- INSERT TABELA TIPO USUARIO
INSERT INTO TIPO_USUARIO(ID_TIPO_USUARIO, NM_TIPO_USUARIO) VALUES(1, 'ADMINISTRADOR');
INSERT INTO TIPO_USUARIO(ID_TIPO_USUARIO, NM_TIPO_USUARIO) VALUES(2, 'COMUM');
COMMIT;


-- INSERT TABELA USUARIO
INSERT INTO USUARIO(ID_USUARIO, NM_USUARIO, LOGIN, SENHA, ID_TIPO_USUARIO, SEXO, DT_NASCIMENTO) VALUES(1, 'DANIEL GERHARD BROWN', 'danbrown@gmail.com', '12345', 1, 'M', to_date('22/06/1964', 'dd/mm/yyyy'));
INSERT INTO USUARIO(ID_USUARIO, NM_USUARIO, LOGIN, SENHA, ID_TIPO_USUARIO, SEXO, DT_NASCIMENTO) VALUES(2, 'JOGADOR DA SILVA', 'gamerdasilva@gmail.com', '12345', 1, 'M', to_date('22/06/1964', 'dd/mm/yyyy'));
COMMIT;



INSERT INTO HISTORIA(ID_HISTORIA, NM_HISTORIA, ENREDO, ID_USUARIO, FAIXA_ETARIA) VALUES(1, 'ANJOS E DEMONIOS', 'O professor de Simbologia de Harvard, Robert Langdon é chamado a um dos maiores centros de pesquisa científica do mundo, o CERN para investigar um estranho símbolo marcado a fogo no peito de um cientista suíço.', 1, 16);
INSERT INTO HISTORIA(ID_HISTORIA, NM_HISTORIA, ENREDO, ID_USUARIO, FAIXA_ETARIA) VALUES(2, 'O CÓDIGO DA VINCI', 'O curador do Louvre e Grão mestre do Priorado de Sião, Jacques Saunière, é fatalmente baleado por um monge católico albino chamado Silas, que está trabalhando em nome de alguém que ele conhece apenas como O Mestre, que deseja descobrir a localização da "pedra chave", um item crucial na busca pelo Santo Graal.

Depois que o corpo de Saunière é descoberto na pose do Homem Vitruviano, a polícia convoca o professor de Harvard Robert Langdon, que está na cidade a negócios. O capitão da polícia Bezu Fache diz que ele foi convocado para ajudar a polícia a decodificar a mensagem enigmática que Saunière deixou durante os últimos minutos de sua vida.', 1, 18);


INSERT INTO HISTORIA(ID_HISTORIA, NM_HISTORIA, ENREDO, ID_USUARIO, FAIXA_ETARIA) VALUES(3, 'O SIMBOLO PERDIDO', 'Chamado por seu amigo Peter Solomon para dar uma palestra em Washington, Robert Langdon viaja até a capital americana, mas ao entrar no palco para iniciar a palestra descobre que tudo aquilo foi uma forma de atraí-lo até ali para iniciar uma busca por um antigo portal místico que tornaria possível a Apoteose. ', 1, 14);

INSERT INTO HISTORIA(ID_HISTORIA, NM_HISTORIA, ENREDO, ID_USUARIO, FAIXA_ETARIA) VALUES(4, 'INFERNO', 'No coração da Itália, Robert Langdon, o professor de Simbologia de Harvard, é arrastado para um mundo angustiante centrado numa das obras literárias mais duradouras e misteriosas da história: O Inferno, de Dante Alighieri.', 1, 16);

INSERT INTO HISTORIA(ID_HISTORIA, NM_HISTORIA, ENREDO, ID_USUARIO, FAIXA_ETARIA) VALUES(5, 'ORIGEM', 'De onde viemos? Para onde vamos?
Robert Langdon, o famoso professor de Simbologia de Harvard, chega ao ultramoderno Museu Guggenheim de Bilbao para assistir a uma apresentação sobre uma grande descoberta que promete “mudar para sempre o papel da ciência”.', 1, 18);

COMMIT;


-- DIFICULDADE
INSERT INTO DIFICULDADE(ID_DIFICULDADE, NM_DIFICULDADE) VALUES(1, 'FACIL');
INSERT INTO DIFICULDADE(ID_DIFICULDADE, NM_DIFICULDADE) VALUES(2, 'MEDIA');
INSERT INTO DIFICULDADE(ID_DIFICULDADE, NM_DIFICULDADE) VALUES(3, 'DIFICIL');
COMMIT;


-- PAIS
INSERT INTO PAIS(ID_PAIS, NM_PAIS) VALUES(1, 'FRANÇA');
INSERT INTO PAIS(ID_PAIS, NM_PAIS) VALUES(2, 'INGLATERRA');
INSERT INTO PAIS(ID_PAIS, NM_PAIS) VALUES(3, 'ESCOCIA');
INSERT INTO PAIS(ID_PAIS, NM_PAIS) VALUES(4, 'ITALIA');
INSERT INTO PAIS(ID_PAIS, NM_PAIS) VALUES(4, 'TURQUIA');
COMMIT;

-- CIDADE
INSERT INTO CIDADE(ID_CIDADE, NM_CIDADE, ID_PAIS) VALUES(1, 'PARIS', 1);

COMMIT;

-- LOCAL
INSERT INTO LOCAL(ID_LOCAL, NM_LOCAL, DESCRICAO, COORDERNADA, ID_CIDADE) VALUES(1, 'MUSEU DO LOUVRE', 'Antigo palácio histórico que abriga uma enorme coleção de artes, de esculturas romanas à "Mona Lisa" de da Vinci.', '48.860791, 2.337633', 1);


-- ENIGMA
INSERT INTO ENIGMA(ID_ENIGMA, NM_ENIGMA, DESCRICAO, ORDEM, ID_HISTORIA, ID_ENIGMA_ORIGEM, ID_DIFICULDADE, ID_ENIGMA_DESTINO) VALUES(1, 'Jacques Saunière', 'NUMEROS NO CORPO', 1, 2, NULL, 2, NULL);
COMMIT;

-- PISTAS
INSERT INTO PISTA(ID_PISTA, NM_PISTA, PISTA, ORDEM, ID_ENIGMA, ID_LOCAL_ORIGEM, ID_LOCAL_DESTINO) VALUES(1, 'numeros fibonacci', 1, 'A sequencia de números representam as sequencia fibonacci.
 Resposta: FIBONACCI', 1, 1, null, null);
INSERT INTO PISTA(ID_PISTA, NM_PISTA, PISTA, ORDEM, ID_ENIGMA, ID_LOCAL_ORIGEM, ID_LOCAL_DESTINO) VALUES(1, 'coordenadas', 1, 'Coordenadas de um lugar qualquer.
 Resposta: COORDENDA', 1, 1, null, null);
COMMIT;


-- TIPO SOLUCAO 
INSERT INTO TIPO_SOLUCAO(ID_TIPO_SOLUCAO, NM_TIPO_SOLUCAO) VALUES(1, 'TEXTO');
INSERT INTO TIPO_SOLUCAO(ID_TIPO_SOLUCAO, NM_TIPO_SOLUCAO) VALUES(1, 'MULTI');
COMMIT;


-- SOLUCAO
INSERT INTO SOLUCAO(ID_SOLUCAO, NM_SOLUCAO, DESCRICAO, RESPOSTA, ID_ENIGMA, ID_TIPO_SOLUCAO) VALUES(1, 'SOLUCAO 001', 'SOL DO ENIGMA 001', 'FIBONACCI', 1, 1);
COMMIT;

-- COMEÇANDO JOGO
INSERT INTO JOGO(ID_JOGO, ID_USUARIO, ID_HISTORIA, DT_INICIO, DT_FIM) VALUES(1, 2, 2, SYSDATE, NULL);
INSERT INTO FASE_JOGO(DT_INICIO, DT_FIM, ID_JOGO, ID_ENIGMA) VALUES(SYSDATE, NULL, 1, 1);



