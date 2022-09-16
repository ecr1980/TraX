class UpdateBugsDescriptionAndSteps < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :description
    remove_column :bugs, :steps
    add_column :bugs, :description, :text
    add_column :bugs, :steps, :text
  end
end
