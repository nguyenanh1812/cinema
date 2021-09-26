class ScreensController < ApplicationController
  before_action :logged_in_user, only: [:show]
  def show
    @show = Show.find(params[:show_id])
    @screen = Screen.find_by(id: @show.screen_id)
    @seats = CinenmaSeat.where(screen_id: @screen.id)
  end
end
