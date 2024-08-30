class UrlsController < ApplicationController
  before_action :set_url, only: %i[index show]

  def index
    @url ||= Url.new
  end

  def create
    @url = Url.new(target_url: url_params[:target_url])

    if @url.save
      @full_url = request.base_url + '/urls/' + @url.short_url
      flash.now[:notice] = 'URL successfully created!'
    else
      @error_message = @url.errors.full_messages.join(', ')
    end

    render :index
  end

  def show
    track_visit
    redirect_to @url.target_url, allow_other_host: true
  end

  private

  def set_url
    @url = Url.find_by(short_url: params[:id])
  end

  def url_params
    params.require(:url).permit(:target_url)
  end

  def track_visit
    @url.increment_clicks_count!
    @url.visits.create(ip_address: request&.remote_ip, geolocation: nil, timestamp: Time.current)
  end
end
