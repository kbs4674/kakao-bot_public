class AddMealTimeToCrawlChunMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :crawl_chun_meals, :meal_time, :string
  end
end
