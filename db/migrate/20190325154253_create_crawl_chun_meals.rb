class CreateCrawlChunMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_chun_meals do |t|
      t.string :title

      t.timestamps
    end
  end
end
