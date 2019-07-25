# Desafio para Engenheiro(a) de Software - VAGAS.com

## Introdução

### Recrutando candidatos

Um recrutador precisa analisar as candidaturas recebidas para vagas de emprego. Dado o grande volume de candidaturas em algumas vagas, olhar um a um seria um trabalho muito demorado.

O desafio é desenvolver uma ferramenta para auxiliar o recrutador, indicando as pessoas mais aderentes para cada vaga. A especificações da API podem ser acessadas aqui: https://github.com/VAGAScom/desafio-tecnico/blob/master/desafio-tecnico.md

## Requisitos
### Ruby
### Banco de Dados SQLite

  - Para a instalação dos requisitos no Ubuntu -> https://gorails.com/setup/ubuntu/19.04
  - Para instação dos requisitos no OSX -> https://gorails.com/setup/osx/10.14-mojave
  - Para instalação dos requisitos no Windows -> https://gorails.com/setup/windows/10
  
# Instalação

### Tendo como base um ambiente linux, no terminal, digite:
```
git clone https://github.com/JBNascimento/desafio_vagas.git
cd desafio_vagas
gem install bundler
bundle install
rake db:migrate

E em seguida para rodar o servidor Puma:
rails s -p 9000

```

# Escrevendo e acessando os dados

### Tendo como exemplo o uso do [Postman](https://www.getpostman.com/) para as requisições:

No campo Headers do Postman, adicione a KEY "Content-Type e VALUE "application/json"


## Endpoints

### 1. Para cadastrar vagas de emprego

**Request:** 

```POST http://localhost:9000/v1/vagas```

+ Body:

```json
{
    "empresa": "Teste",
    "titulo": "Vaga teste",
    "descricao": "Criar os mais diferentes tipos de teste",
    "localizacao": "A",
    "nivel": 3
}
```

### 2. Para cadastrar pessoas

**Request:** 

```POST http://localhost:9000/v1/pessoas```

+ Body:

```json
{
    "nome": "John Doe",
    "profissao": "Engenheiro de Software",
    "localizacao": "C",
    "nivel": 2
}
```

### 3. Registrar candidatura de uma pessoa em uma vaga

Neste endpoint você deverá registar a candidatura do candidato para a vaga em questão.

**Request:** 

```POST http://localhost:9000/v1/candidaturas```

+ Body:

```json
{
    "id_vaga": 1,
    "id_pessoa": 2
}
```

### 4. Para retornar os candidatos de uma vaga, ordenados pelo score (de forma decrescente)

**GET:** `http://localhost:9000/v1/vagas/1/candidaturas/ranking`

**Response:**

```json
[
    {
        "nome": "Mary Jane",
        "profissao": "Engenheira de Software",
        "localizacao": "A",
        "nivel": 4,
        "score": 100
	},
    {
        "nome": "John Doe",
        "profissao": "Engenheiro de Software",
        "localizacao": "C",
        "nivel": 2,
        "score": 85
	},
    ...
]
```










### Contato
```
Jeferson Nascimento: jbnascimento@msn.com
```
