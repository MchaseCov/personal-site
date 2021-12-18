require 'test_helper'

class ScrollerTest < ActiveSupport::TestCase
  include TestModelValidations
  # test_validates_presence_of
  # test_validates_uniqueness_of
  #
  test_validates_presence_of :body

  test 'Scrollers belong to a card' do
    assert scrollers(:one).card
  end
end
