require 'hand'

class PagesController < ApplicationController
  def home
    if session[:hand]
      @hand = session[:hand]
    else
      @error = session[:error]
    end
  end

  def create
    @hand = Hand.new(params[:poker][:hand]).identify

    if @hand
      session[:hand] = @hand
    else 
      session[:error] = 'error: something went wrong go back and try again'
    end
    
    redirect_to '/'
  end
end
