class AddReferenceToBugs < ActiveRecord::Migration[7.0]
  def change
    add_reference :bugs, :user
    add_reference :comments, :user
    add_reference :comments, :bug
  end
end
