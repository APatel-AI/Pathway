class FormsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    #Scrape forms from the USCIS website
    forms = UscisScraper.scrape_forms

    #Filter forms based on the search query
    if params[:query].present?
      query = params[:query].downcase
      forms = forms.select do |form|
        form[:name].downcase.include?(query) || form[:details].downcase.include?(query)
      end
    end

    #Available form categories
    @categories = [
      "Forms",
      "Adoptions",
      "Citizenship and Naturalization",
      "Employment",
      "Family",
      "Green Card",
      "Humanitarian Benefits",
    ]

    #Filter forms by selected caategory if provided
    forms = forms.select { |form| categorize_form(form[:name]) == params[:category] } if params[:category].present?

    #Paginatee the filtered forms, (10 per page)
    @forms = WillPaginate::Collection.create(params[:page] || 1, 10, forms.length) do |pager|
      start = pager.offset
      pager.replace forms[start, pager.per_page]
    end

    @breadcrumbs = [
      { name: "Home", url: root_path },
      { name: "Forms", url: forms_path },
    ]
  end

  private

  #Categorize forms based on their name
  def categorize_form(form_name)
    case form_name.downcase
    when /adoption/
      "Adoptions"
    when /citizenship|naturalization/
      "Citizenship and Naturalization"
    when /employment/
      "Employment"
    when /family/
      "Family"
    when /green card|permanent resident/
      "Green Card"
    when /humanitarian|benefit/
      "Humanitarian Benefits"
    else
      "Forms"
    end
  end
end
