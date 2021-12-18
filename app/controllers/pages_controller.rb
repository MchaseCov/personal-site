class PagesController < ApplicationController
  def main
    @cards = Card.main_cards.includes(:scrollers)
  end

  def about; end
end
