class AddSuspendedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :suspended, :boolean, default: false, null: false
  end
end
