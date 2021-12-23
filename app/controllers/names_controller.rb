class NamesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @name = Name.find_by(session_id: session.id.to_s) || Name.new
  end

  def create
    create_or_update
  end
  
  def update
    create_or_update
  end

  private

  def create_or_update
    @game = Game.find(params[:game_id])
    @name = @game.names.where(session_id: session.id.to_s).first_or_create
    @name.update(name_params)
    redirect_to @game
  end

  def name_params
    params.require(:name).permit(:name)
  end
end
