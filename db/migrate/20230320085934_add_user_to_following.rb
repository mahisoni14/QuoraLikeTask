class AddUserToFollowing < ActiveRecord::Migration[6.0]
  def change
    add_reference :followings, :user, null: false, foreign_key: true
    add_column :followings, :following_id, :integer
  end
end
