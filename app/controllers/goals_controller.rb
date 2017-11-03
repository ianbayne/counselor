class GoalsController < ApplicationController
  def show
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user[:id]
    @goal.counsellor_id = current_user.counsellor_id
    @goal.save
    redirect_to user_path(current_user)
  end

  def destroy
    if Goal.exists?(id: params[:id])
      @goal = Goal.find(params[:id])
      @goal.destroy
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)  
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:content)
  end

end
