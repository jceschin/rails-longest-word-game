class GamesController < ApplicationController
  def new
    @letters = []
    12.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @word = params[:word].last.split("")
    @answer = ""

    @word.each do |letter|
      if !@letters.includes?(letter)
        @letters = @letters.join(",")
        @answer = "Sorry but #{@word.join} can't be built out of #{@letters}"
      end
    end

    if !@answer

    end
  end

end
