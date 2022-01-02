class AddThumbnailsToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :thumbnail, :string
  end
end
