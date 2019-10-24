class AddKindOfMealToCrawlChunMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :crawl_chun_meals, :kind_of_meal, :string
  end
end
