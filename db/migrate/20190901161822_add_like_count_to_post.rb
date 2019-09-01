class AddLikeCountToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :likes_count, :integer
    add_column :users, :likes_count, :integer
  end
end
