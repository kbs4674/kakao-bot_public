class CreateAlarms < ActiveRecord::Migration[5.1]
  def change
    create_table :alarms do |t|
      t.string :title
      t.boolean :is_agree

      t.timestamps
    end
  end
end
