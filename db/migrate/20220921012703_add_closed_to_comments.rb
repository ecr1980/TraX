class AddClosedToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :closed, :boolean
  end
end
