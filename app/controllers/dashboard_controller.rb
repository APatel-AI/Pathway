class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:greetings, :home]

  def home
    if user_signed_in?
      redirect_to dashboard_path
    else
      redirect_to landing_path
    end
  end

  def greetings
    @message = "Welcome to Pathway"
  end
end
