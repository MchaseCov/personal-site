class AddPageNameToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :page_name, :string
  end
end
