# == Table Schema ==
#
# table name: cards
#
# id              :bigint       null: false, primary key
# title           :string
# body            :text
# call_to_action  :string
# icon_class      :string
# page_name       :string
# cta_path        :string
# created_at      :datetime     null: false
# updated_at      :datetime     null: false
#
class Card < ApplicationRecord
  # Callbacks

  # Scopes
  scope :main_cards, -> { where(page_name: 'main') }

  # Validations
  validates_presence_of :title, :body, :call_to_action, :icon_class, :page_name, :cta_path
  validates :title, uniqueness: true
  validates_format_of :icon_class, with: /(fas |fab |far )/
  validates :page_name, inclusion: { in: %w[main about portfolio], message: '%<value>s is not a valid page!' }

  # Associations
  has_many :scrollers

  # Methods
end
