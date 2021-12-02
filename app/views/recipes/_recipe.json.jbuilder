json.extract! recipe, :id, :title, :description, :method, :prep, :cooking_time, :author, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
