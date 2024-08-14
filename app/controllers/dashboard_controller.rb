class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:greetings, :home]


  def dashboard
    @start_date = params[:start_date] ? Date.parse(params[:start_date]) : Date.current.beginning_of_month
    @date_range = (@start_date.beginning_of_month..@start_date.end_of_month).to_a

    @dependents = current_user.dependents
    @documents = Document.where(dependent: @dependents).where.not(expiry_date: nil)

  end

  def home
    if user_signed_in?
      redirect_to dashboard_path
    else
      redirect_to landing_path
    end
  end
end
