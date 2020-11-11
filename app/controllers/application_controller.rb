class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def verify_authorized
    super unless devise_controller?
  end

  private

  def user_not_authorized
    flash[:alert] = "Non sei autorizzato a compiere questa azione"
    redirect_to root_path
  end
end
