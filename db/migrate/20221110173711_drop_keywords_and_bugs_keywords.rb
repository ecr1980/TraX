class DropKeywordsAndBugsKeywords < ActiveRecord::Migration[7.0]
  def change
    drop_table :keywords
    drop_table :bugs_keywords
  end
end
