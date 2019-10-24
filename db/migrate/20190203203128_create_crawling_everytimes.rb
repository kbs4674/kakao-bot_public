class CreateCrawlingEverytimes < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_everytimes do |t|
      t.string :title
      t.text :content
      t.integer :article_id
      t.integer :comment_id
      t.text :comment_content
      t.integer :category_id
      t.string :category_name

      t.timestamps
    end
  end
end
