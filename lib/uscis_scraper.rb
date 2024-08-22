class UscisScraper
  BASE_URL = 'https://www.uscis.gov/forms/all-forms'
  SITE_URL = 'https://www.uscis.gov'

  CATEGORIES = {
    "Forms" => BASE_URL,
    "Adoptions-Based Forms" => "#{BASE_URL}?topic_id[]=1127",
    "Citizenship and Naturalization-Based Forms" => "#{BASE_URL}?topic_id[]=1128",
    "Employment-Based Forms" => "#{BASE_URL}?topic_id[]=1129",
    "Family-Based Forms" => "#{BASE_URL}?topic_id[]=1130",
    "Green Card-Based Forms" => "#{BASE_URL}?topic_id[]=1131",
    "Humanitarian Benefits-Based Forms" => "#{BASE_URL}?topic_id[]=1132"
  }

  def self.scrape_forms
    forms = []

    CATEGORIES.each do |category_name, url|
      response = fetch_page(url)
      next unless response

      parsed_page = Nokogiri::HTML(response.body)
      forms.concat(scrape_category_forms(parsed_page, category_name))
    end

    forms
  end

  def self.fetch_categories(forms)
    forms.map { |form| form[:category] }.uniq.compact
  end

  private

  def self.fetch_page(url)
    HTTParty.get(url)
  rescue StandardError => e
    puts "Error fetching page: #{e.message}"
    nil
  end

  def self.scrape_category_forms(parsed_page, category_name)
    parsed_page.css('.views-row').map do |form|
      form_name = form.css('.field-content a').text.strip
      form_url = build_form_url(form)
      form_details = form.css('.field-content .form-description').text.strip

      { name: form_name, url: form_url, details: form_details, category: category_name }
    end
  end

  def self.build_form_url(form)
    relative_path = form.css('.field-content a').attr('href').value
    URI.join(SITE_URL, relative_path).to_s
  end
end
