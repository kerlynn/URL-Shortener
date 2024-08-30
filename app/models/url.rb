class Url < ApplicationRecord
  has_many :visits, dependent: :destroy

  before_validation :prepend_http_if_missing

  validates :target_url, presence: true
  validates :short_url, uniqueness: true, length: { maximum: 15 }

  before_create :set_short_url

  def increment_clicks_count!
    increment!(:clicks_count)
  end

  private

  def prepend_http_if_missing
    return if target_url.blank?

    self.target_url = "http://#{target_url}" unless target_url.match?(%r{\Ahttp://|https://})
  end

  def set_short_url
    UrlShortenerService.new(self).call
  end
end
