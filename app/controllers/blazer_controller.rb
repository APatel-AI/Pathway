# frozen_string_literal: true

class BlazerController < Blazer::DashboardsController
  before_action :authenticate_user!
end
