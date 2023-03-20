class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.boolean :is_follow

      t.timestamps
    end
  end
end
