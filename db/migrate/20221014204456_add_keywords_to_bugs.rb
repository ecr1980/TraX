class AddKeywordsToBugs < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :keywords, :string
    add_column :bugs, :keywords, :text
  end
end

