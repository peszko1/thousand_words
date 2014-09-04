require 'open-uri'

class WordsController < ApplicationController
  def train
    @word = WordsService.new(current_user).next_word
    if @word
      @translation_pl = Yandex::Client.translate(@word.original)
      @translations = Wordnik.word.get_definitions(@word.original, limit: 5).map{|w|w["text"]}
    end
  end

  def trained
    word = Word.find(params[:id])
    trained = word.trained_words.where(user: current_user).first
    trained ||= TrainedWord.create!(word: word, status: 0, user: current_user)

    trained.update_status!

    redirect_to root_path
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.create(params)
  end

  def edit
    
  end  
 end
