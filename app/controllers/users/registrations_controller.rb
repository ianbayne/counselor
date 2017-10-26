class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  
  include Accessible
  
  # GET /resource/sign_up
  def new
    @answers = session[:answers].map { |hash| Answer.new(hash) }
    @matched_counsellors = Counsellor.all
    @answers.each do |answer|
      # below works as I know which quesion's id is related to which issue
      if answer.question.id == 1 && answer.content == 1
        @matched_counsellors = @matched_counsellors.tagged_with(:work_related)
      end
      if answer.question.id == 2 && answer.content == 1
        @matched_counsellors = @matched_counsellors.tagged_with(:relationship)
      end
      if answer.question.id == 3 && answer.content == 1
        @matched_counsellors = @matched_counsellors.tagged_with(:loss)
      end
      if answer.question.id == 4 && answer.content == 1
        @matched_counsellors = @matched_counsellors.tagged_with(:financial)
      end
      if answer.question.id == 6 && answer.content == 1
        @matched_counsellors = @matched_counsellors.where(gender: 0)
      end
      if answer.question.id == 7 && answer.content == 1
        @matched_counsellors = @matched_counsellors.where(gender: 1)
      end
    end
    if @matched_counsellors.count >= 4
      @matched_counsellors = @matched_counsellors.order("RANDOM()").limit(3)
    end
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :counsellor_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :counsellor_id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
