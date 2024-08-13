class FormsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    forms = UscisScraper.scrape_forms


    # Filter forms based on the search query
    if params[:query].present?
      query = params[:query].downcase
      forms = forms.select do |form|
        form[:name].downcase.include?(query) || form[:details].downcase.include?(query)
      end
    end


    @categories = [
      "Forms",
      "Adoptions-Based Forms",
      "Citizenship and Naturalization-Based Forms",
      "Employment-based Forms",
      "Family-based Forms",
      "Green Card-based Forms",
      "Humanitarian Benefits-based Forms",

    ]

    if params[:category].present?
      forms = forms.select { |form| categorize_form(form[:name]) == params[:category] }
    end

    @forms = WillPaginate::Collection.create(params[:page] || 1, 10, forms.length) do |pager|
      start = pager.offset
      pager.replace forms[start, pager.per_page]
    end
  end

  private

  def categorize_form(form_name)
    case form_name.downcase
    when /adoption/
      "Adoptions-Based Forms"
    when /citizenship|naturalization/
      "Citizenship and Naturalization-Based Forms"
    when /employment/
      "Employment-based Forms"
    when /family/
      "Family-based Forms"
    when /green card|permanent resident/
      "Green Card-based Forms"
    when /humanitarian|benefit/
      "Humanitarian Benefits-based Forms"
    else
      "Forms"
    end
  end
end
