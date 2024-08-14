class BlazerController < Blazer::DashboardsController
  before_action :authenticate_user!

end
