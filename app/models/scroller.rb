# == Table Schema ==
#
# table name: scrollers
#
# id              :bigint       null: false, primary key
# body            :text
# created_at      :datetime     null: false
# updated_at      :datetime     null: false
# card_id         :index        null: false, foreign key for cards
#
class Scroller < ApplicationRecord
  # Callbacks
  # Scopes
  # Validations
  validates_presence_of :body
  # Associations
  belongs_to :card
  # Methods
end
