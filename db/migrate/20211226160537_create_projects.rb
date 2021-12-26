class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :screenshot_url
      t.string :thumb_icon
      t.text :full_desc
      t.text :small_desc
      t.string :repo_url
      t.string :live_url
      t.text :feature_list, array: true, default: []

      t.timestamps
    end
  end
end
