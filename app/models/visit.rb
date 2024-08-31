class Visit < ApplicationRecord
  belongs_to :url
  validates :ip_address, presence: true

  before_save :set_geolocation

  private

  def set_geolocation
    return if ip_address.blank?

    location = Geocoder.search(ip_address).first
    self.geolocation = if location
                         "#{location.city}, #{location.region}, #{location.country}"
                       else
                         'Unknown'
                       end
  end
end
