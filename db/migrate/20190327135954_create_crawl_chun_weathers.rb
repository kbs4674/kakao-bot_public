class CreateCrawlChunWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_chun_weathers do |t|
      t.string :status
      t.string :province
      t.string :degree
      t.string :rainy
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
