class AddMoreDetailsToBugs < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :open, :bool
  end
end
