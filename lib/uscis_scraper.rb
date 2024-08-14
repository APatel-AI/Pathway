class UscisScraper
  BASE_URL = 'https://www.uscis.gov/forms/all-forms'
  SITE_URL = 'https://www.uscis.gov'

  CATEGORIES = {
    "Forms" => BASE_URL,
    "Adoptions-Based Forms" => 'https://www.uscis.gov/forms/all-forms?topic_id[]=1127',
    "Citizenship and Naturalization-Based Forms" => 'https://www.uscis.gov/forms/all-forms?topic_id[]=1128',
    "Employment-Based Forms" => 'https://www.uscis.gov/forms/all-forms?topic_id[]=1129',
    "Family-Based Forms" => 'https://www.uscis.gov/forms/all-forms?topic_id[]=1130',
    "Green Card-Based Forms" => 'https://www.uscis.gov/forms/all-forms?topic_id[]=1131',
    "Humanitarian Benefits-Based Forms" => 'https://www.uscis.gov/forms/all-forms?topic_id[]=1132'
  }

  def self.scrape_forms
    forms = []

    CATEGORIES.each do |category_name, url|
      response = HTTParty.get(url)
      parsed_page = Nokogiri::HTML(response.body)

      parsed_page.css('.views-row').each do |form|
        form_name = form.css('.field-content a').text.strip
        form_url = URI.join(SITE_URL, form.css('.field-content a').attr('href').value).to_s
        form_details = form.css('.field-content .form-description').text.strip

        forms << { name: form_name, url: form_url, details: form_details, category: category_name }
      end
    end

    forms
  end

  def self.fetch_categories(forms)
    forms.map { |form| form[:category] }.uniq.compact
  end
end
