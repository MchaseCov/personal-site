class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :desc
      t.text :body
      t.string :associated_url
      t.string :url_text

      t.timestamps
    end
  end
end
