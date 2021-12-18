class AddCtaPathToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :cta_path, :string
  end
end
