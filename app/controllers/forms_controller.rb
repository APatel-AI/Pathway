class FormsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @forms = UscisScraper.scrape_forms

  end

end
