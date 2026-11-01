CREATE TABLE faculdade_academica;

USE faculdade_academica;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS pre_requisito;
DROP TABLE IF EXISTS matricula;
DROP TABLE IF EXISTS ministra;
DROP TABLE IF EXISTS salas;
DROP TABLE IF EXISTS turmas;
DROP TABLE IF EXISTS matriz_curricular;
DROP TABLE IF EXISTS vincula_curso;
DROP TABLE IF EXISTS bolsista_parcial;
DROP TABLE IF EXISTS bolsista_integral;
DROP TABLE IF EXISTS area_formacao;
DROP TABLE IF EXISTS pos_graduacao;
DROP TABLE IF EXISTS graduacao;
DROP TABLE IF EXISTS disciplinas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS funcionarios_adm;
DROP TABLE IF EXISTS professores;
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS endereco;
DROP TABLE IF EXISTS telefone;
DROP TABLE IF EXISTS email;
DROP TABLE IF EXISTS usuarios;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE usuarios (
    id_usuario BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL,
    genero CHAR(1),
    data_nascimento DATE,
    PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuarios_cpf UNIQUE (cpf),
    CONSTRAINT chk_usuarios_genero
        CHECK (genero IN ('M', 'F'))
);

CREATE TABLE email (
    id_email BIGINT UNSIGNED AUTO_INCREMENT,
    id_usuario BIGINT UNSIGNED NOT NULL,
    email VARCHAR(254) NOT NULL,
    PRIMARY KEY (id_email),
    CONSTRAINT uq_email_email UNIQUE (email),
    CONSTRAINT fk_email_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE telefone (
    id_telefone BIGINT UNSIGNED AUTO_INCREMENT,
    id_usuario BIGINT UNSIGNED NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    PRIMARY KEY (id_telefone),
    CONSTRAINT uq_telefone_usuario_numero UNIQUE (id_usuario, telefone),
    CONSTRAINT fk_telefone_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE endereco (
    id_endereco BIGINT UNSIGNED AUTO_INCREMENT,
    id_usuario BIGINT UNSIGNED NOT NULL,
    numero VARCHAR(15),
    logradouro VARCHAR(150) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    cep CHAR(8),
    PRIMARY KEY (id_endereco),
    CONSTRAINT fk_endereco_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE alunos (
    id_alunos BIGINT UNSIGNED AUTO_INCREMENT,
    id_usuario BIGINT UNSIGNED NOT NULL,
    situacao_academica VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    data_ingresso DATE NOT NULL,
    codigo_aluno VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_alunos),
    CONSTRAINT uq_alunos_usuario UNIQUE (id_usuario),
    CONSTRAINT uq_alunos_codigo UNIQUE (codigo_aluno),
    CONSTRAINT fk_alunos_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE professores (
    id_professores BIGINT UNSIGNED AUTO_INCREMENT,
    id_usuario BIGINT UNSIGNED NOT NULL,
    data_admissao DATE NOT NULL,
    matricula VARCHAR(30) NOT NULL,
    maior_titulacao VARCHAR(80),
    regime_trabalho VARCHAR(50),
    PRIMARY KEY (id_professores),
    CONSTRAINT uq_professores_usuario UNIQUE (id_usuario),
    CONSTRAINT uq_professores_matricula UNIQUE (matricula),
    CONSTRAINT fk_professores_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE funcionarios_adm (
    id_funcionarios_adm BIGINT UNSIGNED AUTO_INCREMENT,
    id_usuario BIGINT UNSIGNED NOT NULL,
    id_endereco BIGINT UNSIGNED,
    matricula_funcionario VARCHAR(30) NOT NULL,
    cargo VARCHAR(80) NOT NULL,
    setor VARCHAR(80) NOT NULL,
    data_admissao DATE NOT NULL,
    PRIMARY KEY (id_funcionarios_adm),
    CONSTRAINT uq_funcadm_usuario UNIQUE (id_usuario),
    CONSTRAINT uq_funcadm_matricula UNIQUE (matricula_funcionario),
    CONSTRAINT fk_funcadm_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_funcadm_endereco FOREIGN KEY (id_endereco)
        REFERENCES endereco(id_endereco)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE area_formacao (
    id_area_formacao BIGINT UNSIGNED AUTO_INCREMENT,
    id_professores BIGINT UNSIGNED NOT NULL,
    area_formacao VARCHAR(120) NOT NULL,
    PRIMARY KEY (id_area_formacao),
    CONSTRAINT uq_area_professor UNIQUE (id_professores, area_formacao),
    CONSTRAINT fk_area_professor FOREIGN KEY (id_professores)
        REFERENCES professores(id_professores)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE bolsista_integral (
    id_bolsista_integral BIGINT UNSIGNED AUTO_INCREMENT,
    id_alunos BIGINT UNSIGNED NOT NULL,
    data_inicial DATE NOT NULL,
    data_final DATE,
    programa_concedente VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_bolsista_integral),
    CONSTRAINT uq_bolsa_integral_aluno UNIQUE (id_alunos),
    CONSTRAINT fk_bolsa_integral_aluno FOREIGN KEY (id_alunos)
        REFERENCES alunos(id_alunos)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_bolsa_integral_datas CHECK (data_final IS NULL OR data_final >= data_inicial)
);

CREATE TABLE bolsista_parcial (
    id_bolsista_parcial BIGINT UNSIGNED AUTO_INCREMENT,
    id_alunos BIGINT UNSIGNED NOT NULL,
    programa_concedente VARCHAR(150) NOT NULL,
    percentual_bolsa DECIMAL(5,2) NOT NULL,
    data_inicial DATE NOT NULL,
    data_final DATE,
    PRIMARY KEY (id_bolsista_parcial),
    CONSTRAINT uq_bolsa_parcial_aluno UNIQUE (id_alunos),
    CONSTRAINT fk_bolsa_parcial_aluno FOREIGN KEY (id_alunos)
        REFERENCES alunos(id_alunos)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_percentual_bolsa CHECK (percentual_bolsa > 0 AND percentual_bolsa < 100),
    CONSTRAINT ck_bolsa_parcial_datas CHECK (data_final IS NULL OR data_final >= data_inicial)
);

CREATE TABLE cursos (
    id_curso BIGINT UNSIGNED AUTO_INCREMENT,
    qtd_semestres TINYINT UNSIGNED NOT NULL,
    situacao VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    data_criacao DATE NOT NULL,
    modalidade VARCHAR(30) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    carga_horaria SMALLINT UNSIGNED NOT NULL,
    duracao_prevista VARCHAR(50),
    PRIMARY KEY (id_curso),
    CONSTRAINT uq_cursos_nome_modalidade UNIQUE (nome, modalidade),
    CONSTRAINT ck_cursos_semestres CHECK (qtd_semestres > 0),
    CONSTRAINT ck_cursos_carga CHECK (carga_horaria > 0)
);

CREATE TABLE graduacao (
    id_graduacao BIGINT UNSIGNED AUTO_INCREMENT,
    id_curso BIGINT UNSIGNED NOT NULL,
    qtd_creditos SMALLINT UNSIGNED,
    grau_academico VARCHAR(60) NOT NULL,
    PRIMARY KEY (id_graduacao),
    CONSTRAINT uq_graduacao_curso UNIQUE (id_curso),
    CONSTRAINT fk_graduacao_curso FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE pos_graduacao (
    id_pos_graduacao BIGINT UNSIGNED AUTO_INCREMENT,
    id_curso BIGINT UNSIGNED NOT NULL,
    tipo_pos VARCHAR(60) NOT NULL,
    ch_minima SMALLINT UNSIGNED,
    requisito_ingresso VARCHAR(255),
    PRIMARY KEY (id_pos_graduacao),
    CONSTRAINT uq_pos_curso UNIQUE (id_curso),
    CONSTRAINT fk_pos_curso FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE disciplinas (
    id_disciplina BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    ementa TEXT,
    ch_teorica SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    ch_pratica SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    qtd_creditos TINYINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_disciplina),
    CONSTRAINT uq_disciplinas_nome UNIQUE (nome),
    CONSTRAINT ck_disciplinas_carga CHECK (ch_teorica + ch_pratica > 0)
);

CREATE TABLE matriz_curricular (
    id_matriz_curricular BIGINT UNSIGNED AUTO_INCREMENT,
    id_curso BIGINT UNSIGNED NOT NULL,
    id_disciplina BIGINT UNSIGNED NOT NULL,
    semestre_recomendado TINYINT UNSIGNED,
    tipo_disciplina VARCHAR(50) NOT NULL,
    carga_horaria SMALLINT UNSIGNED NOT NULL,
    data_inicio_vigencia DATE NOT NULL,
    data_final_vigencia DATE,
    PRIMARY KEY (id_matriz_curricular),
    CONSTRAINT uq_matriz_disciplina_vigencia
        UNIQUE (id_curso, id_disciplina, data_inicio_vigencia),
    CONSTRAINT fk_matriz_curso FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_matriz_disciplina FOREIGN KEY (id_disciplina)
        REFERENCES disciplinas(id_disciplina)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_matriz_semestre CHECK (semestre_recomendado IS NULL OR semestre_recomendado > 0),
    CONSTRAINT ck_matriz_datas CHECK (data_final_vigencia IS NULL OR data_final_vigencia >= data_inicio_vigencia)
);

CREATE TABLE pre_requisito (
    id_disciplina BIGINT UNSIGNED NOT NULL,
    id_pre_requisito BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_disciplina, id_pre_requisito),
    CONSTRAINT fk_prereq_disciplina FOREIGN KEY (id_disciplina)
        REFERENCES disciplinas(id_disciplina)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_prereq_requisito FOREIGN KEY (id_pre_requisito)
        REFERENCES disciplinas(id_disciplina)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ck_prereq_nao_igual CHECK (id_disciplina <> id_pre_requisito)
);

CREATE TABLE vincula_curso (
    id_vincula_curso BIGINT UNSIGNED AUTO_INCREMENT,
    id_alunos BIGINT UNSIGNED NOT NULL,
    id_curso BIGINT UNSIGNED NOT NULL,
    numero_matricula VARCHAR(30) NOT NULL,
    data_conclusao DATE,
    situacao_ingresso VARCHAR(40) NOT NULL,
    data_ingresso DATE NOT NULL,
    forma_ingresso VARCHAR(50) NOT NULL,
    turno VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_vincula_curso),
    CONSTRAINT uq_vincula_numero_matricula UNIQUE (numero_matricula),
    CONSTRAINT fk_vincula_aluno FOREIGN KEY (id_alunos)
        REFERENCES alunos(id_alunos)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_vincula_curso FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_vincula_datas CHECK (data_conclusao IS NULL OR data_conclusao >= data_ingresso)
);

CREATE TABLE turmas (
    id_turma BIGINT UNSIGNED AUTO_INCREMENT,
    id_curso BIGINT UNSIGNED NOT NULL,
    id_disciplina BIGINT UNSIGNED NOT NULL,
    identificacao_turma VARCHAR(40) NOT NULL,
    situacao VARCHAR(30) NOT NULL DEFAULT 'Ativa',
    turno VARCHAR(30) NOT NULL,
    qtd_maxima_alunos SMALLINT UNSIGNED NOT NULL,
    dia_semana VARCHAR(30),
    horario_bloco VARCHAR(60),
    PRIMARY KEY (id_turma),
    CONSTRAINT uq_turma_identificacao UNIQUE (identificacao_turma),
    CONSTRAINT fk_turma_curso FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_turma_disciplina FOREIGN KEY (id_disciplina)
        REFERENCES disciplinas(id_disciplina)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_turma_max_alunos CHECK (qtd_maxima_alunos > 0)
);

CREATE TABLE salas (
    id_sala BIGINT UNSIGNED AUTO_INCREMENT,
    id_turma BIGINT UNSIGNED,
    bloco VARCHAR(30) NOT NULL,
    capacidade SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_sala),
    CONSTRAINT uq_sala_turma UNIQUE (id_turma),
    CONSTRAINT fk_sala_turma FOREIGN KEY (id_turma)
        REFERENCES turmas(id_turma)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT ck_sala_capacidade CHECK (capacidade > 0)
);

CREATE TABLE ministra (
    id_ministra BIGINT UNSIGNED AUTO_INCREMENT,
    id_turma BIGINT UNSIGNED NOT NULL,
    id_professores BIGINT UNSIGNED NOT NULL,
    carga_horaria SMALLINT UNSIGNED NOT NULL,
    data_atribuicao DATE NOT NULL,
    PRIMARY KEY (id_ministra),
    CONSTRAINT uq_ministra_turma_professor UNIQUE (id_turma, id_professores),
    CONSTRAINT fk_ministra_turma FOREIGN KEY (id_turma)
        REFERENCES turmas(id_turma)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_ministra_professor FOREIGN KEY (id_professores)
        REFERENCES professores(id_professores)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_ministra_carga CHECK (carga_horaria > 0)
);

CREATE TABLE matricula (
    id_matricula BIGINT UNSIGNED AUTO_INCREMENT,
    id_alunos BIGINT UNSIGNED NOT NULL,
    id_turma BIGINT UNSIGNED NOT NULL,
    resultado_final VARCHAR(40),
    nota_final DECIMAL(4,2),
    frequencia_final DECIMAL(5,2),
    data_matricula DATE NOT NULL,
    situacao VARCHAR(30) NOT NULL DEFAULT 'Ativa',
    PRIMARY KEY (id_matricula),
    CONSTRAINT uq_matricula_aluno_turma UNIQUE (id_alunos, id_turma),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_alunos)
        REFERENCES alunos(id_alunos)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma)
        REFERENCES turmas(id_turma)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_matricula_nota CHECK (nota_final IS NULL OR (nota_final >= 0 AND nota_final <= 10)),
    CONSTRAINT ck_matricula_frequencia CHECK (frequencia_final IS NULL OR (frequencia_final >= 0 AND frequencia_final <= 100))
);
