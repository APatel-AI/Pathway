class FormsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    forms = UscisScraper.scrape_forms
    @forms = WillPaginate::Collection.create(params[:page] || 1, 10, forms.length) do |pager|
      start = pager.offset
      pager.replace forms[start, pager.per_page]
    end
  end
end
