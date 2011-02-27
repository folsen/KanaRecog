class HighscoresController < ApplicationController
  # GET /highscores
  # GET /highscores.xml
  def index
    if params[:name] && !params[:name].empty?
      @highscores = Highscore.find_all_by_name(params[:name])
    else
      @highscores = Highscore.find(:all, :order => "score DESC", :limit => 50)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @highscores }
    end
  end
  
  # POST /highscores
  # POST /highscores.xml
  def create
    @highscore = Highscore.new(params[:highscore])

    if @highscore.save
      redirect_to :action => :index
    end
  end

end
