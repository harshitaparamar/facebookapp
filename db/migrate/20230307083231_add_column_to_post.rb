class AddColumnToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :body, :text
    add_column :posts, :image, :string
  end
end
