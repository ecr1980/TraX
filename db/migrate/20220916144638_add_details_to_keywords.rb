class AddDetailsToKeywords < ActiveRecord::Migration[7.0]
  def change
    add_column :keywords, :word, :string
  end
end
