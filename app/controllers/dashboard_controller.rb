class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @dependents = current_user.dependents
  end

  def home
    if user_signed_in?
      redirect_to dashboard_path
    else
      redirect_to landing_path
    end
  end

  def greetings
  end
end
