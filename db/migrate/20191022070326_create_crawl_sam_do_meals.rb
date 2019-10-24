class CreateCrawlSamDoMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_sam_do_meals do |t|
      t.string :title
      t.string :campus
      t.string :menu
      t.string :meal_date
      t.string :meal_time
      t.string :kind_of_meal
      t.string :etc

      t.timestamps
    end
  end
end
