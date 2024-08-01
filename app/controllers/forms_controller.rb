class FormsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    forms = UscisScraper.scrape_forms

    if params[:query].present?
      query = params[:query].downcase
      forms = forms.select do |form|
        form[:name].downcase.include?(query) || form[:details].downcase.include?(query)
      end
    end

    @forms = WillPaginate::Collection.create(params[:page] || 1, 10, forms.length) do |pager|
      start = pager.offset
      pager.replace forms[start, pager.per_page]
    end
  end
end
