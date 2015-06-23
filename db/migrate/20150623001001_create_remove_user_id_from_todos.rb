class CreateRemoveUserIdFromTodos < ActiveRecord::Migration
  def change
    create_table :remove_user_id_from_todos do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
