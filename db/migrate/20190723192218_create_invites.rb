class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string :group
      t.string :code
      t.string :etc
      t.boolean :is_used, default: false
      t.string :user_id

      t.timestamps
    end
  end
end
