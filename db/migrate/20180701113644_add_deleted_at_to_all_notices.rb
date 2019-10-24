class AddDeletedAtToAllNotices < ActiveRecord::Migration[5.1]
  def change
    add_column :all_notices, :deleted_at, :datetime
    add_index :all_notices, :deleted_at
  end
end
