# https://github.com/plataformatec/devise/
# wiki/How-to-Setup-Multiple-Devise-User-Models

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_counsellor
      flash.clear
      # if counsellor tries to visit user page, redicrect to counsellor dashboard
      # currently redirect to home page as there is no dash board view
      # redirect_to(rails_admin.dashboard_path) && return
      redirect_to(current_counsellor) && return
    elsif current_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      # if counsellor tries to visit user page, redicrect to counsellor dashboard
      # currently redirect to home page as there is no dash board view
      # redirect_to(authenticated_user_root_path) && return
      redirect_to(user_path(current_user)) && return
    end
  end
end