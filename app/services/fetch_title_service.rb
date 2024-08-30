require 'open-uri'
require 'nokogiri'

class FetchTitleService
  def initialize(url)
    @url = url
  end

  def call
    fetch_title
  end

  private

  def fetch_title
    return 'Unknown Title' if @url.blank?

    begin
      html = URI.open(@url, 'User-Agent' => 'Mozilla/5.0')
      doc = Nokogiri::HTML(html)
      doc.title || 'Unknown Title'
    rescue StandardError => e
      Rails.logger.error "Failed to fetch title for #{@url}: #{e.message}"
      'Unknown Title'
    end
  end
end
