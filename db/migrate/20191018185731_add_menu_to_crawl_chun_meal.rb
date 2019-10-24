class AddMenuToCrawlChunMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :crawl_chun_meals, :menu, :string
  end
end
