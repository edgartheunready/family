class NamesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    if params[:kid_mode] == 'true'
      @kid_mode = true
      @name = Name.new
    else
      @name = @game.names.find_by(session_id: session.id.to_s) || Name.new
    end
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
    if params[:name][:kid_mode].present? && params[:name][:kid_mode] == 'true'
      @name = @game.names.create(name_params)
      session[:kid_mode] = 't'
    else
      @name = @game.names.where(session_id: session.id.to_s).first_or_create
      @name.update(name_params)
      session[:kid_mode] = 'f'
    end
    redirect_to @game
  end

  def name_params
    params.require(:name).permit(:name)
  end
end
