require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    12.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    # Take word and letters
    @word = params[:word].upcase
    @letters = params[:letters].split
    # Check if word can be built from original grid (word vs letters)
    @included = included?(@word, @letters)

    # Check if its an english word
    @english_word = english_word?(@word)

    # Create answer
    if !@included
      @answer = "Sorry but #{@word} cant be build out of #{@letters.join(',')}"
    elsif !@english_word
      @answer = "Sorry but #{@word} does not seem to be valid english word"
    else
      @answer = "Congratulations! #{@word} is a valid English word!"
    end
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
