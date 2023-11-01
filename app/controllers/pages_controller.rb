class PagesController < ApplicationController
  def main
    @cards = Card.main_cards
  end

  def about; end
end
