class AddDetailsToBugs < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :description, :string
    add_column :bugs, :steps, :string
    add_column :bugs, :severity, :integer
  end
end
