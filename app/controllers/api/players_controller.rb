module Api
  class PlayersController < ApplicationController

    before_action do
      request.format = :json
    end

    def index
      render json: Player.all.order("rank")
    end

    def show
      render json: Player.find(params[:id])
    end

    def update
      @player = Player.find(params[:id])
      @player.update(params.require(:player).permit([:on_team, :available]))

      Pusher['drafty'].trigger('drafted', @player.to_json)

      render json: @player
    end
    def draft

    end
  end
end
