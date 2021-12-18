class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :body
      t.string :call_to_action
      t.string :icon_class

      t.timestamps
    end
  end
end
