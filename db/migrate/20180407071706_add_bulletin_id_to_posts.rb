class AddBulletinIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :bulletin, foreign_key: true
  end
end
