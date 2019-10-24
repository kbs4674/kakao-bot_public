class CreateCrawlHangangTemps < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_hangang_temps do |t|
      t.string :title

      t.timestamps
    end
  end
end
