class RenamePostIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :post_id, :book_id
  end
end
