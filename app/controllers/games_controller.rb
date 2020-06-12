class GamesController < ApplicationController
  def new
    @letters = []
    12.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @words = params[:word]
    @word = @words.last.split("")
    @answer = ""

    @word.each do |letter|
      if !@letters.include?(letter)
        @letters = @letters.join(",")
        @answer = "Sorry but #{@word.join} can't be built out of #{@letters}"
      end
    end

    if !@answer

    end
  end

end
