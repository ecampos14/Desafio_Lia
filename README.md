# Desafio_Lia
 
# API REST para Pesquisa de Cursos

Esta é uma API REST simples para pesquisar cursos com base em filtros de curso, nível e turno.

## Requisitos

Certifique-se de ter Ruby e as seguintes gemas instaladas:

- Sinatra
- JSON

Você pode instalá-las com os seguintes comandos:

```bash
gem install sinatra json
```

## Executando a API

1. Clone ou baixe este repositório.

2. Navegue até o diretório do projeto:

```bash
cd caminho/para/o/projeto
```

3. Execute o arquivo `app.rb` com o Ruby:

```bash
ruby app.rb
```

A API estará disponível em `http://localhost:4000/`.

## Rotas Disponíveis

### Cenário Vazio

- Para buscar todos os cursos, acesse:

```bash
http://localhost:4000/
```

### Pesquisa por Curso

- Para buscar cursos de um determinado curso, substitua `:course` pelo nome do curso desejado:

```bash
http://localhost:4000/ingles
```

### Pesquisa por Curso e Nível

- Para buscar cursos de um curso e nível específicos, substitua `:course` e `:level` pelos valores desejados:

```bash
http://localhost:4000/espanhol/avancado
```

### Pesquisa por Curso, Nível e Turno

- Para buscar cursos de um curso, nível e turno específicos, substitua `:course`, `:level` e `:shift` pelos valores desejados:

```bash
http://localhost:4000/espanhol/avancado/manha
```

## Exemplos de Uso

Você pode usar ferramentas como `curl` ou aplicativos como o [Postman](https://www.postman.com/) para fazer solicitações às rotas da API e obter os resultados.

Exemplo de solicitação de busca por cursos de inglês:

```bash
curl http://localhost:4000/ingles
```
