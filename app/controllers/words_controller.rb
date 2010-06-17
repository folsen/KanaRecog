class WordsController < ApplicationController

  def index
  end

  # Pick ten new words randomly
  def show
    if params[:id] == "2"
      @words = Word.all(:order => 'random()', :conditions => {:kind => 0}, :limit => 5)
      @words2 = Word.all(:order => 'random()', :conditions => {:kind => 1}, :limit => 5)
      @words = @words + @words2
      @words.shuffle!
    else
      @words = Word.all(:order => 'random()', :conditions => {:kind => params[:id]}, :limit => 10)
    end
    render :json => @words.to_json
  end
  
end
