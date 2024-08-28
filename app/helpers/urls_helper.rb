module UrlsHelper
  def full_short_url(visit)
    request.base_url + '/urls/' + visit.url.short_url
  end
end
