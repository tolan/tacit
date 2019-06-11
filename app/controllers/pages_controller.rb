class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :demoindex, :demoshow]

  def home
  end

  def charts
    @data = Operation.group_by_month(:date).where.not(subscription: nil).count.to_json
  end
end
