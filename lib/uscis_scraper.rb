require 'nokogiri'
require 'httparty'
require 'uri'
require 'open-uri'


class UscisScraper
  BASE_URL = 'https://www.uscis.gov/forms/all-forms'
  SITE_URL = 'https://www.uscis.gov'

  def self.scrape_forms
    response = HTTParty.get(BASE_URL)
    parsed_page = Nokogiri::HTML(response.body)
    forms = []

    parsed_page.css('.views-row').each do |form|
      form_name = form.css('.field-content a').text.strip
      form_url = URI.join(SITE_URL, form.css('.field-content a').attr('href').value).to_s
      form_details = form.css('.field-content .form-description').text.strip
      forms << { name: form_name, url: form_url, details: form_details }
    end

    forms
  end
end
