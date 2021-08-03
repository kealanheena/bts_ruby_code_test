require 'hand'
require 'poker'

class PagesController < ApplicationController
  def home
    if session[:result]
      @result = session[:result]
    else
      @error = session[:error]
    end
  end

  def create
    hand = Hand.new(params[:poker][:hand])
    poker_game = Poker.new(hand)
    
    if poker_game
      hand_rank = poker_game.rank_hand
      session[:result] = hand_rank
    else 
      session[:error] = 'error: something went wrong go back and try again'
    end
    
    redirect_to '/'
  end
end
