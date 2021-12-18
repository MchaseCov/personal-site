require 'test_helper'

class CardTest < ActiveSupport::TestCase
  include TestModelValidations
  # test_validates_presence_of
  # test_validates_uniqueness_of
  #
  test_validates_presence_of :title, :body, :call_to_action, :icon_class, :page_name, :cta_path

  test 'invalid if icon_class does not begin with fas, far or fab and space' do
    icon_class = 'fao foo'
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

  test 'Cards have many scrollers' do
    assert_equal 2, cards(:main_page_card).scrollers.size
  end

  test 'title must be unique' do
    title = 'ABC123'
    original_card = Card.new(title: title, body: 'test', call_to_action: 'test', cta_path: 'path',
                             icon_class: 'fas foo', page_name: 'main')
    duplicate_card = Card.new(title: title, body: 'test', call_to_action: 'test', cta_path: 'path',
                              icon_class: 'fas foo', page_name: 'main')

    assert original_card.save
    assert Card.pluck(:title).include?(title)
    assert_not duplicate_card.save
    duplicate_card.errors.messages[:title].include?('has already been taken')
  end
end
