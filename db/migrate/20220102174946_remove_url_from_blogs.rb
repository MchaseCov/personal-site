class RemoveUrlFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :url_text, :string
    remove_column :blogs, :associated_url, :string
  end
end
