
CREATE TABLE TB_ENDERECO (
                ID_ENDERECO INT NOT NULL,
                RUA_ENDERECO VARCHAR(100) NOT NULL,
                NUMERO_ENDERECO VARCHAR(100) NOT NULL,
                ESTADO_ENDERECO CHAR(2) NOT NULL,
                PAIS_ENDERECO VARCHAR(100) NOT NULL,
                PRIMARY KEY (ID_ENDERECO)
);


CREATE TABLE TB_FUNCIONARIO (
                ID_FUNCIONARIO INT NOT NULL,
                NOME_FUNCIONARIO VARCHAR(100) NOT NULL,
                GENERO_FUNCIONARIO CHAR(1) NOT NULL,
                TIPO_SANGUINEO_FUNCIONARIO VARCHAR(3) NOT NULL,
                DATA_NASCIMENTO_FUNCIONARIO DATE NOT NULL,
                ID_ENDERECO INT NOT NULL,
                PRIMARY KEY (ID_FUNCIONARIO)
);


CREATE TABLE TB_AFASTADO (
                ID_FUNCIONARIO INT NOT NULL,
                DATA_AFASTADO DATE NOT NULL,
                PRIMARY KEY (ID_FUNCIONARIO)
);


CREATE TABLE TB_MEDICO (
                ID_FUNCIONARIO INT NOT NULL,
                QUALIFICACAO_MEDICO VARCHAR(100) NOT NULL,
                PRIMARY KEY (ID_FUNCIONARIO)
);


CREATE TABLE TB_ENFERMEIRO (
                ID_FUNCIONARIO INT NOT NULL,
                NUMERO_PACIENTES_ENFERMEIRO INT NOT NULL,
                PRIMARY KEY (ID_FUNCIONARIO)
);


CREATE TABLE TB_DEPARTAMENTO (
                ID_DEPARTAMENTO INT NOT NULL,
                NOME_DEPARTAMENTO VARCHAR(100) NOT NULL,
                CHEFE_DEPARTAMENTO VARCHAR(100) NOT NULL,
                ID_ENDERECO INT NOT NULL,
                PRIMARY KEY (ID_DEPARTAMENTO)
);


CREATE TABLE TB_TRABALHOU (
                ID_DEPARTAMENTO INT NOT NULL,
                ID_FUNCIONARIO INT NOT NULL,
                PRIMARY KEY (ID_DEPARTAMENTO, ID_FUNCIONARIO)
);


CREATE TABLE TB_ATIVO (
                ID_FUNCIONARIO INT NOT NULL,
                DESDE_ATIVO DATE NOT NULL,
                ID_DEPARTAMENTO INT NOT NULL,
                PRIMARY KEY (ID_FUNCIONARIO)
);


CREATE TABLE TB_QUARTO (
                ID_QUARTO INT NOT NULL,
                CUSTO_QUARTO FLOAT NOT NULL,
                TIPO_QUARTO VARCHAR(100) NOT NULL,
                ID_ENDERECO INT NOT NULL,
                PRIMARY KEY (ID_QUARTO)
);


CREATE TABLE TB_LABORATORIO (
                ID_LABORATORIO INT NOT NULL,
                NOME_LABORATORIO VARCHAR(100) NOT NULL,
                TELEFONE_LABORATORIO VARCHAR(11) NOT NULL,
                EMAIL_LABORATORIO VARCHAR(100) NOT NULL,
                SITE_LABORATORIO VARCHAR(100) NOT NULL,
                PRIMARY KEY (ID_LABORATORIO)
);


CREATE TABLE TB_TESTE (
                ID_TESTE INT NOT NULL,
                NOME_TESTE VARCHAR(100) NOT NULL,
                CUSTO_TESTE FLOAT NOT NULL,
                ID_LABORATORIO INT NOT NULL,
                PRIMARY KEY (ID_TESTE)
);


CREATE TABLE TB_MEDICAMENTO (
                ID_MEDICAMENTO INT NOT NULL,
                NOME_MEDICAMENTO VARCHAR(100) NOT NULL,
                CUSTO_MEDICAMENTO FLOAT NOT NULL,
                ID_LABORATORIO INT NOT NULL,
                PRIMARY KEY (ID_MEDICAMENTO)
);


CREATE TABLE TB_PACIENTE (
                ID_PACIENTE INT NOT NULL,
                NOME_PACIENTE VARCHAR(100) NOT NULL,
                GENERO_PACIENTE CHAR(1) NOT NULL,
                TIPO_SANGUINEO_PACIENTE VARCHAR(3) NOT NULL,
                DATA_NASCIMENTO_PACIENTE DATE NOT NULL,
                ID_FUNCIONARIO INT NOT NULL,
                PRIMARY KEY (ID_PACIENTE)
);


CREATE TABLE TB_INTERNADO (
                ID_PACIENTE INT NOT NULL,
                CHEGADA_INTERNADO DATE NOT NULL,
                LIBERACAO_INTERNADO DATE NOT NULL,
                DOENCA_INTERNADO VARCHAR(100) NOT NULL,
                ID_FUNCIONARIO INT NOT NULL,
                PRIMARY KEY (ID_PACIENTE)
);


CREATE TABLE TB_RELACAO (
                ID_QUARTO INT NOT NULL,
                ID_PACIENTE INT NOT NULL,
                CHEGADA DATE NOT NULL,
                PRIMARY KEY (ID_QUARTO, ID_PACIENTE)
);


CREATE TABLE TB_CONTATO (
                NOME_CONTATO VARCHAR(100) NOT NULL,
                ID_PACIENTE INT NOT NULL,
                RELACAO_CONTATO VARCHAR(100) NOT NULL,
                TELEFONE_CONTATO VARCHAR(11) NOT NULL,
                PRIMARY KEY (NOME_CONTATO, ID_PACIENTE)
);


CREATE TABLE TB_AMBULATORIO (
                ID_PACIENTE INT NOT NULL,
                CHEGADA_AMBULATORIO DATE NOT NULL,
                DOENCA VARCHAR(100) NOT NULL,
                PRIMARY KEY (ID_PACIENTE)
);


CREATE TABLE TB_USA (
                ID_MEDICAMENTO INT NOT NULL,
                ID_PACIENTE INT NOT NULL,
                QUANTIDADE_USA INT NOT NULL,
                DESDE_USA DATE NOT NULL,
                PRIMARY KEY (ID_MEDICAMENTO, ID_PACIENTE)
);


CREATE TABLE TB_FEZ (
                ID_PACIENTE INT NOT NULL,
                ID_TESTE INT NOT NULL,
                TESTE_DATA DATE NOT NULL,
                PRIMARY KEY (ID_PACIENTE, ID_TESTE)
);


CREATE TABLE TB_CONTA (
                DATA_CONTA DATE NOT NULL,
                ID_PACIENTE INT NOT NULL,
                CUSTO_TESTE_CONTA FLOAT NOT NULL,
                CUSTO_QUARTO_CONTA FLOAT NOT NULL,
                CUSTO_MEDICAMENTO_CONTA FLOAT NOT NULL,
                CUSTO_OUTROS_CONTA FLOAT NOT NULL,
                PRIMARY KEY (DATA_CONTA, ID_PACIENTE)
);


ALTER TABLE TB_QUARTO ADD CONSTRAINT tb_endereco_tb_quarto_fk
FOREIGN KEY (ID_ENDERECO)
REFERENCES TB_ENDERECO (ID_ENDERECO);

ALTER TABLE TB_DEPARTAMENTO ADD CONSTRAINT tb_endereco_tb_departamento_fk
FOREIGN KEY (ID_ENDERECO)
REFERENCES TB_ENDERECO (ID_ENDERECO);

ALTER TABLE TB_FUNCIONARIO ADD CONSTRAINT tb_endereco_tb_funcionario_fk
FOREIGN KEY (ID_ENDERECO)
REFERENCES TB_ENDERECO (ID_ENDERECO);

ALTER TABLE TB_ENFERMEIRO ADD CONSTRAINT tb_funcionario_tb_enfermeiro_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_FUNCIONARIO (ID_FUNCIONARIO)
ON DELETE CASCADE;

ALTER TABLE TB_MEDICO ADD CONSTRAINT tb_funcionario_tb_medico_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_FUNCIONARIO (ID_FUNCIONARIO)
ON DELETE CASCADE;

ALTER TABLE TB_ATIVO ADD CONSTRAINT tb_funcionario_tb_ativo_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_FUNCIONARIO (ID_FUNCIONARIO)
ON DELETE CASCADE;

ALTER TABLE TB_AFASTADO ADD CONSTRAINT tb_funcionario_tb_afastado_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_FUNCIONARIO (ID_FUNCIONARIO)
ON DELETE CASCADE;

ALTER TABLE TB_TRABALHOU ADD CONSTRAINT tb_afastado_tb_trabalhou_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_AFASTADO (ID_FUNCIONARIO);

ALTER TABLE TB_PACIENTE ADD CONSTRAINT tb_medico_tb_paciente_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_MEDICO (ID_FUNCIONARIO);

ALTER TABLE TB_INTERNADO ADD CONSTRAINT tb_enfermeiro_tb_internado_fk
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES TB_ENFERMEIRO (ID_FUNCIONARIO)
ON DELETE CASCADE;

ALTER TABLE TB_ATIVO ADD CONSTRAINT tb_departamento_tb_ativo_fk
FOREIGN KEY (ID_DEPARTAMENTO)
REFERENCES TB_DEPARTAMENTO (ID_DEPARTAMENTO)
ON DELETE CASCADE;

ALTER TABLE TB_TRABALHOU ADD CONSTRAINT tb_departamento_tb_trabalhou_fk
FOREIGN KEY (ID_DEPARTAMENTO)
REFERENCES TB_DEPARTAMENTO (ID_DEPARTAMENTO);

ALTER TABLE TB_RELACAO ADD CONSTRAINT tb_quarto_tb_relacao_fk
FOREIGN KEY (ID_QUARTO)
REFERENCES TB_QUARTO (ID_QUARTO);

ALTER TABLE TB_MEDICAMENTO ADD CONSTRAINT tb_laboratorio_tb_medicamento_fk
FOREIGN KEY (ID_LABORATORIO)
REFERENCES TB_LABORATORIO (ID_LABORATORIO);

ALTER TABLE TB_TESTE ADD CONSTRAINT tb_laboratorio_tb_teste_fk
FOREIGN KEY (ID_LABORATORIO)
REFERENCES TB_LABORATORIO (ID_LABORATORIO);

ALTER TABLE TB_FEZ ADD CONSTRAINT tb_teste_tb_fez_fk
FOREIGN KEY (ID_TESTE)
REFERENCES TB_TESTE (ID_TESTE);

ALTER TABLE TB_USA ADD CONSTRAINT tb_medicamento_tb_usa_fk
FOREIGN KEY (ID_MEDICAMENTO)
REFERENCES TB_MEDICAMENTO (ID_MEDICAMENTO);

ALTER TABLE TB_CONTA ADD CONSTRAINT tb_paciente_tb_conta_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_PACIENTE (ID_PACIENTE)
ON DELETE CASCADE;

ALTER TABLE TB_FEZ ADD CONSTRAINT tb_paciente_tb_fez_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_PACIENTE (ID_PACIENTE);

ALTER TABLE TB_USA ADD CONSTRAINT tb_paciente_tb_usa_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_PACIENTE (ID_PACIENTE);

ALTER TABLE TB_AMBULATORIO ADD CONSTRAINT tb_paciente_tb_ambulatorio_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_PACIENTE (ID_PACIENTE)
ON DELETE CASCADE;

ALTER TABLE TB_INTERNADO ADD CONSTRAINT tb_paciente_tb_internado_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_PACIENTE (ID_PACIENTE)
ON DELETE CASCADE;

ALTER TABLE TB_CONTATO ADD CONSTRAINT tb_internado_tb_contato_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_INTERNADO (ID_PACIENTE)
ON DELETE CASCADE;

ALTER TABLE TB_RELACAO ADD CONSTRAINT tb_internado_tb_relacao_fk
FOREIGN KEY (ID_PACIENTE)
REFERENCES TB_INTERNADO (ID_PACIENTE);
