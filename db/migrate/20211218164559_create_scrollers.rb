class CreateScrollers < ActiveRecord::Migration[7.0]
  def change
    create_table :scrollers do |t|
      t.text :body
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
