class CreateAllNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :all_notices do |t|
      t.string :title
      t.text :content
      t.boolean :allow_comment, default: true
      t.boolean :global_notice
      t.boolean :local_notice
      t.string :user_nickname
      t.integer :user_id

      t.timestamps
    end
  end
end
