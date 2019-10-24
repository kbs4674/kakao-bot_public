class CreateCrawlChunNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_chun_notices do |t|
      t.string :kind
      t.string :title
      t.string :campus
      t.string :date

      t.timestamps
    end
  end
end
