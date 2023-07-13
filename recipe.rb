class Recipe
    attr_reader :name, :ingredients, :method_steps
    
    # レシピを初期化
    def self.clear
      @@recipes = {}
    end
  
    # レシピを記述
    def self.describe(&block)
      instance_eval(&block)
    end
  
    # レシピを作成
    def self.recipe(name, &block)
      recipe = Recipe.new(name)
      recipe.instance_eval(&block)
      @@recipes[name] = recipe
    end
  
    # 特定のレシピをクラス変数から取得
    def self.for(name)
      @@recipes[name]
    end
  
    def initialize(name)
      @name = name
      @ingredients = []
      @method_steps = []
    end
  
    # レシピインスタンスに材料を追加
    def ingredient(ingredient)
      @ingredients << ingredient
    end
  
    # レシピインスタンスに手順を追加
    def method(&block)
      instance_eval(&block)
    end
  
    def step(step)
      @method_steps << step
    end
  end
  