class CreateBotFuncRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :bot_func_ranks do |t|
      t.string :title
      t.integer :year
      t.integer :hit_1, default: 0
      t.integer :hit_2, default: 0
      t.integer :hit_3, default: 0
      t.integer :hit_4, default: 0
      t.integer :hit_5, default: 0
      t.integer :hit_6, default: 0
      t.integer :hit_7, default: 0
      t.integer :hit_8, default: 0
      t.integer :hit_9, default: 0
      t.integer :hit_10, default: 0
      t.integer :hit_11, default: 0
      t.integer :hit_12, default: 0

      t.timestamps
    end
  end
end
