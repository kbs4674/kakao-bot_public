class AddMealDateToCrawlChunMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :crawl_chun_meals, :meal_date, :string
  end
end
