class MoodsController < ApplicationController
  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @user = current_user
    @mood.user = @user
    if @mood.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "invalid mood input"
      redirect_to user_path(@user)
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:mood)
  end
end
