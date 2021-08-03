require 'hand'
require 'poker'

class PagesController < ApplicationController
  def home
    if session[:hand]
      @result = session[:result]
    else
      @error = session[:error]
    end
  end

  def create
    @hand = Hand.new(params[:poker][:hand]).identify
    
    if @hand
      @result = Poker.new().rank_hand(@hand)
      session[:result] = @result
    else 
      session[:error] = 'error: something went wrong go back and try again'
    end
    
    redirect_to '/'
  end
end
