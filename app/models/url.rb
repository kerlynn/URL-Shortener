class Url < ApplicationRecord
  has_many :visits, dependent: :destroy
  validates :target_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :short_url, uniqueness: true, length: { maximum: 15 }

  before_create :set_short_url

  def increment_clicks_count!
    increment!(:clicks_count)
  end

  private

  def set_short_url
    UrlShortenerService.new(self).generate_short_url
  end
end
