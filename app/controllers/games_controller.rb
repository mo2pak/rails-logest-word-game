require 'net/http'

class GamesController < ApplicationController
  def new
    @letters = ""
    8.times{@letters  << (65 + rand(25)).chr}
    @letters
  end

  def score
    @input = params[:word]   
    uri = URI("https://wagon-dictionary.herokuapp.com/#{@input}")
    json = Net::HTTP.get(uri) # => String
    if (JSON.parse(json)["found"] == "true")
      @found = true
    else
      @found = false
    end
    

    
  end
end
