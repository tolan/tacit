class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :demoindex, :demoshow]

  def home
  end

  def demoindex
    @subscritption = subscriptions.uniq.find(189)
  end


end
