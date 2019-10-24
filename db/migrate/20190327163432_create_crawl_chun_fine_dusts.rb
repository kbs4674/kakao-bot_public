class CreateCrawlChunFineDusts < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_chun_fine_dusts do |t|
      t.string :time
      t.string :province
      t.string :station
      t.string :pm10
      t.string :pm25
      t.string :state
      t.string :state_micro

      t.timestamps
    end
  end
end
