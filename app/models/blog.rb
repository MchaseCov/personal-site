# == Table Schema ==
#
# table name: blogs
#
# id              :bigint       null: false, primary key
# title           :string
# desc            :string
# body            :text
# associated_url  :string
# url_text        :string
# thumbnail       :string
# created_at      :datetime     null: false
# updated_at      :datetime     null: false
#
class Blog < ApplicationRecord
  validates_presence_of :title, :desc, :body, :thumbnail
  validates :title, uniqueness: true
end
