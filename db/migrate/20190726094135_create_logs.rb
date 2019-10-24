class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :service_name
      t.string :service_type
      t.integer :user_id
      t.string :ip
      t.string :key

      t.timestamps
    end
  end
end
