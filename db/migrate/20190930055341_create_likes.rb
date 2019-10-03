class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :micropost
      t.references :user

      t.timestamps
    end
  end
end
