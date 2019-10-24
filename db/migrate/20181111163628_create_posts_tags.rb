class CreatePostsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :posts_tags, :id => false do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
