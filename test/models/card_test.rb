require 'test_helper'

class CardTest < ActiveSupport::TestCase
  include TestModelValidations
  # test_validates_presence_of
  # test_validates_uniqueness_of
  #
  test_validates_presence_of :title, :body, :call_to_action, :icon_class, :page_name

  test 'invalid if icon_class does not begin with fas or fab and space' do
    icon_class = 'faz foo'
    card = Card.new(icon_class: icon_class)
    card.valid?
    assert_not card.errors[:icon_class].empty?
  end

  test 'invalid if page_name is not a valid page' do
    page_name = 'main!'
    card = Card.new(page_name: page_name)
    card.valid?
    assert_not card.errors[:page_name].empty?
  end

  test '#main_cards only includes cards where page_name is main' do
    assert_includes Card.main_cards, cards(:main_page_card)
    refute_includes Card.main_cards, cards(:invalid_page_card)
  end
end
