class AddDetailsToBugs2 < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :version, :string
  end
end
