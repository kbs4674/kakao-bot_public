class CreateKakaoBotRandomTips < ActiveRecord::Migration[5.1]
  def change
    create_table :kakao_bot_random_tips do |t|
      t.string :title

      t.timestamps
    end
  end
end
