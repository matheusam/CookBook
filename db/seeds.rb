# recipe types
RecipeType.create(name: 'Acompanhamentos')
RecipeType.create(name: 'Bebidas')
main_dish = RecipeType.create(name: 'Prato Principal')
dessert = RecipeType.create(name: 'Sobremesa')

# cuisines
Cuisine.create(name: 'Portuguesa')
brazilian_cuisine = Cuisine.create(name: 'Brasileira')
german_cuisine = Cuisine.create(name: 'Alemã')

# users
user = User.create(email:'user@email.com', password: '12345678')
other_user = User.create(email:'other_user@email.com', password: '12345678')

# recipes
Recipe.create(title: 'Feijoada', recipe_type: main_dish,
              cuisine: brazilian_cuisine,
              difficulty: 'Médio', cook_time: 120,
              ingredients: 'Feijão e carnes.',
              cook_method: 'Misturar o feijão com as carnes.', user: user)

Recipe.create(title: 'Strudel', recipe_type: dessert,
              cuisine: german_cuisine,
              difficulty: 'Fácil', cook_time: 30,
              ingredients: 'Maça, uvas passas, massa folheada',
              cook_method: 'Cozinhar a maçã e colocar na massa com uva passas.',
              user: other_user)
