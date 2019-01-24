def make_cuisine(name: nil)
  if name.nil?
    create(:cuisine)
  else
    create(:cuisine, name: name)
  end
end

def make_recipe_type(name: nil)
  if name.nil?
    create(:recipe_type)
  else
    create(:recipe_type, name: name)
  end
end

def make_recipe(title: nil)
  if title.nil?
    create(:recipe)
  else
    create(:recipe, title: title)
  end
end

def make_user(email: nil)
  if email.nil?
    create(:user)
  else
    create(:user, email: email)
  end
end
