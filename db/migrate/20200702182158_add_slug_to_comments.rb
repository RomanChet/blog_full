class AddSlugToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :slug, :string
    add_index :comments, :slug, unique: true
  end
end
