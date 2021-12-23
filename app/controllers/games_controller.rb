class GamesController < ApplicationController
  def index

  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(**game_params, session_id: session.id)
    if @game
      redirect_to @game
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
