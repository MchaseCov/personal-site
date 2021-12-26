# == Table Schema ==
#
# table name: projects
#
# id              :bigint       null: false, primary key
# title           :string
# screenshot_url  :string
# thumb_icon      :string
# full_desc       :text
# small_desc      :text
# repo_url        :string
# live_url        :string
# feature_list    :text         array: true, default: []
# created_at      :datetime     null: false
# updated_at      :datetime     null: false
#
class Project < ApplicationRecord
  # Validations
  validates_presence_of :title, :screenshot_url, :thumb_icon, :full_desc, :small_desc, :repo_url, :feature_list
  validates :title, uniqueness: true
  validates_format_of :repo_url, :live_url, :screenshot_url, with: /(http)/
  validates_format_of :thumb_icon, with: /(fas |fab |far )/
end
