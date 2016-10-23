class RecipesController < ApplicationController
   def index
  @recipes = Recipe.all
     if(params["ingredient"])
     @recipes = @recipes.where("ingredients LIKE :query", query: "%#{params["ingredient"]}%")
   end
  end
   def show
   @recipe = Recipe.find(params["id"])
   end

   def new
   end

   def create
   r = Recipe.new
   r.name = params["recipe"]["name"]
   r.ingredients = params["recipe"]["ingredients"]
   r.description = params["recipe"]["description"]
   r.save
   flash[:notice] = "Przepis dodany"
   redirect_to(recipe_path(r))
   end

    def edit
      @recipe = Recipe.find(params["id"])
    end

    def update
    r = Recipe.find(params["id"])
    r.name = params["recipe"]["name"]
   r.ingredients = params["recipe"]["ingredients"]
   r.description = params["recipe"]["description"]
   r.save
   flash[:notice] = "Przepis zmieniony"
   redirect_to(recipe_path(r))
    end

  def destroy
    r = Recipe.find(params["id"])
    r.destroy
    flash[:notice] = "Przepis skasowany"
    redirect_to(recipes_path)
  end

end
