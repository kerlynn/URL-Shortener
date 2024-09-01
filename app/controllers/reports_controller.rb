class ReportsController < ApplicationController
  def usage
    grouped_visits = Visit.includes(:url).order(created_at: :desc).group_by { |visit| visit.url }
    @pagy, @grouped_visits = pagy_array(grouped_visits.to_a, limit: 10)
  end
end
