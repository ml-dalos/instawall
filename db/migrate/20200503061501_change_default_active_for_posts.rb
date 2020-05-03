class ChangeDefaultActiveForPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :posts, :active, to: true
  end
end
