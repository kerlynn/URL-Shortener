class UrlShortenerService
  def initialize(url)
    @url = url
  end

  def generate_short_url
    loop do
      @url.short_url = SecureRandom.alphanumeric(8)
      break unless Url.exists?(short_url: @url.short_url)
    end
  end
end
