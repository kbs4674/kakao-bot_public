class CreateNewNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :new_notifications do |t|
      t.string :content
      t.belongs_to :user
      t.string :link
      t.string :from
      t.timestamps
    end
  end
end
