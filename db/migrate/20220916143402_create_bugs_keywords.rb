class CreateBugsKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs_keywords, id: false do |t|
      t.belongs_to :bug
      t.belongs_to :keyword
    end
  end
end
