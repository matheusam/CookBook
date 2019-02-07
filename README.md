# Cookbook

### Instruções

[Projeto no Trello](https://trello.com/b/egtpbQgY/cookbookpersonal)

O projeto visa a criação de um site para criar e gerenciar recitas entre usuários. O *Cookbook* conta também com uma API na qual é possível realizar todas as operaçõoes que seriam feitas pela interface gráfica.

### Instalação

* `git clone http://qsd.campuscode.com.br/matheusam/cookbook`
* `cd cookbook`
* `bin/setup`

Agora só precisa iniciar o server.

* `rails s`

Obs: Para que o **mirror** funcione sem alterações, é preciso iniciar o servidor na porta 3000.

Para acessar o sistema use os usuários criados no seed.

* user@email.com : _12345678_
* other_user@email.com : _12345678_

### Documentação da **API**

Abaixo serão descritos os end-points e seus retornos:
###### Substituir `<id>` pelo id, e `<params>` pelos parâmetros indicados.

* `get /api/v1/recipes`
  * retorna todas receitas em uma array ao receber um GET, exemplo:
    * `[{"id":1,"title":"Feijoada","difficulty":"Médio","cook_time":120,"created_at":"2019-02-06T21:35:04.957Z","updated_at":"2019-02-06T21:35:04.957Z","ingredients":"Feijão e carnes.","cook_method":"Misturar o feijão com as carnes.","recipe_type_id":3,"cuisine_id":2,"user_id":1,"spotlight":null},{"id":2,"title":"Strudel","difficulty":"Fácil","cook_time":30,"created_at":"2019-02-06T21:35:04.980Z","updated_at":"2019-02-06T21:35:04.980Z","ingredients":"Maça, uvas passas, massa folheada","cook_method":"Cozinhar a maçã e colocar na massa com uva passas.","recipe_type_id":4,"cuisine_id":3,"user_id":2,"spotlight":null}]`


* `get /api/v1/recipes/<id>`
  * retorna detalhes de uma receita ao receber um GET com o id da receita, exemplo:
    * `{"id":1,"title":"Feijoada","difficulty":"Médio","cook_time":120,"created_at":"2019-02-06T21:35:04.957Z","updated_at":"2019-02-06T21:35:04.957Z","ingredients":"Feijão e carnes.","cook_method":"Misturar o feijão com as carnes.","recipe_type_id":3,"cuisine_id":2,"user_id":1,"spotlight":null}`


* `get /api/v1/cuisines/<id>`
  * retorna nome da cozinha ao receber um __GET__ com o id da cozinha, exemplo:
    * `{"cuisine":"Portuguesa"}`


* `get /api/v1/recipe_types/<id>`
  * retorna nome do tipo de receita ao receber um __GET__ com o id do tipo de receita, exemplo:
    * `{"recipe_type":"Acompanhamentos"}`


* `post /api/v1/recipes/new/<params>`

  * `params = { title: 'new_recipe', difficulty: 'hard',                cook_time:10, ingredients: 'blablabla', cook_method: 'blabla',
  recipe_type_id: recipe_type.id, cuisine_id: cuisine.id, user_id: user.id }`

    * cria receita ao enviar parâmetros da mesma por um **POST**, ao criar ela retorna o status 201(created), e retorna a receita no corpo do JSON.



* `put /api/v1/recipes/<params>`
  *   `params = { id: recipe.id, title: 'recipe', difficulty: 'low', cook_time: 10, ingredients: 'blala', cook_method: 'bbla', user: recipe.user.id }`

  * atualiza uma receita ao receber um __PUT__ com os parâmetros corretos, onde é obrigatório o id do usuário para realizar a validação. Ao ser realizar uma solicitação recebe-se um JSON contendo um msg, nele podem ter 3 respostas:
    * Receita atualizada com sucesso
    * Usuário não confere
    * Erro ao processar solicitação


* `delete /api/v1/recipes/<params>`

  * `params = { id: recipe.id, user: recipe.user.id }`

    * apaga uma receita ao receber uma requisição de __DELETE__ passando o id da receita e do usuário para fazer a validação, retorna duas possíveis mensagens:

      * Receita apagada com sucesso
      * Erro ao processar solicitação

### TODO

* Autenticação pela API
* Token na API
