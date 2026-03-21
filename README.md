# PathoFlow 

Sistema web em **PHP puro** para gestão de pacientes e exames em um fluxo simplificado de laboratório de anatomia patológica.

O projeto foi desenvolvido como peça de portfólio com foco em demonstrar conhecimentos práticos em:

- PHP 8.3 (Vanilla)
- MySQL 8.0
- HTML, CSS e JavaScript
- Docker & Docker Compose
- Git e organização de projeto profissional

## Objetivo do Projeto

O **PathoFlow** é um MVP de um sistema LIS (Laboratory Information System) voltado para o controle básico de:

- Cadastro centralizado de pacientes com validação de CPF.
- Registro de exames e amostras vinculados ao paciente.
- Acompanhamento de status do exame (Recebido, Em Análise, Finalizado).
- Organização de dados laboratoriais com integridade referencial.

## Estrutura do Projeto

```text
.
├── docker/             # Configurações de ambiente (PHP, Nginx, MySQL)
├── public/             # Ponto de entrada da aplicação (index.php, assets)
├── routes/             # Lógica de roteamento simples
├── src/                # Core da aplicação (Classes, Configurações, Models)
├── db.sql              # Script de criação e povoamento do banco
├── docker-compose.yml  # Orquestração dos containers
└── README.md
```

## Como Rodar a Aplicação
1. Clonar o repositório
```bash
git clone https://github.com/SamylleMaria/PathoFlow.git
cd PathoFlow
```
2. Subir os containers
```bash
docker-compose up -d
```
3. Acessar no navegador
A aplicação está configurada para rodar na porta 8001:
👉 http://localhost:8001

## Gestão do Banco de Dados
O banco de dados MySQL está exposto externamente na porta 3301.

### Opção A: Povoamento Automático (Recomendado)
Para criar as tabelas e inserir os dados de teste (pacientes e exames) a partir do arquivo db.sql:
```bash
docker exec -i pathoflow_db mysql -u root -proot pathoflow_db < db.sql
```

### Opção B: Acesso Manual via Terminal (CLI)
Para rodar comandos SQL manualmente ou inspecionar as tabelas:
```bash
docker exec -it pathoflow_db mysql -u root -proot pathoflow_db
```

## Modelagem de Dados (Fase Atual)
### Tabela pacientes
Armazena os dados cadastrais. O campo CPF possui restrição de unicidade para evitar duplicidade de prontuários.

### Tabela exames
Gerencia as amostras. Possui relacionamento (FK) com a tabela de pacientes e controle automático de data de entrada e última atualização de status.

## Status do Projeto
Atualmente o projeto concluiu a Fase 2 (Modelagem e Infraestrutura).
As próximas etapas incluem:

- Implementação da conexão PDO.
- Desenvolvimento das telas de listagem e cadastro.
- Lógica de atualização de status via PHP.