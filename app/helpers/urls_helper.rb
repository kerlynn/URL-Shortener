module UrlsHelper
  def full_short_url(url)
    request.base_url + '/urls/' + url.short_url
  end
end
