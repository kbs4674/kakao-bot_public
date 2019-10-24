class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.string :nickname
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
