USE pathoflow_db;

CREATE TABLE IF NOT EXISTS pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS exames (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Adicionado o tipo INT aqui
    paciente_id INT NOT NULL,
    codigo_amostra VARCHAR(20) NOT NULL,
    material VARCHAR(100),
    medico_solicitante VARCHAR(100),
    status ENUM('recebido', 'em_analise', 'finalizado'),
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

INSERT INTO pacientes (nome, CPF, data_nascimento, telefone, email)
VALUES
    ('Maria Silva', '12345678901', '1990-05-12', '85999990001', 'maria.silva@email.com'),
    ('João Souza', '98765432100', '1985-11-23', '85999990002', 'joao.souza@email.com'),
    ('Ana Costa', '45678912300', '2000-02-08', '85999990003', 'ana.costa@email.com'),
    ('Carlos Pereira', '32165498700', '1978-07-30', '85999990004', NULL); -- Corrigido os símbolos aqui


INSERT INTO exames (paciente_id, codigo_amostra, material, medico_solicitante, status)
VALUES
    (1, 'AMOSTRA001', 'Sangue', 'Dr. Almeida', 'recebido'),
    (1, 'AMOSTRA002', 'Urina', 'Dra. Fernanda', 'em_analise'),
    (2, 'AMOSTRA003', 'Biópsia', 'Dr. Ricardo', 'finalizado'),
    (3, 'AMOSTRA004', 'Sangue', 'Dra. Camila', 'recebido'),
    (4, 'AMOSTRA005', 'Urina', 'Dr. Eduardo', 'em_analise'),
    (2, 'AMOSTRA006', 'Sangue', 'Dra. Paula', 'recebido');