class ReportsController < ApplicationController
  def usage
    grouped_visits = Visit.order(created_at: :desc).group_by { |visit| visit.url.short_url }
    @pagy, @grouped_visits = pagy_array(grouped_visits.to_a, limit: 10)
  end
end
