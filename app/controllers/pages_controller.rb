class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :demoindex, :demoshow]

  def home
  end

  def charts
    user = current_user
    all_user_data = Operation.group_by_month(:date).where.not(subscription: nil).sum(:amount_cents)
    all_user_data_formated = all_user_data.each { |date, amount| all_user_data[date] = (amount.fdiv(-100)).fdiv(User.count) }
    user_data = Operation.where(user: user).group_by_month(:date).where.not(subscription: nil).sum(:amount_cents)
    user_data_formated = user_data.each { |date, amount| user_data[date] = amount.fdiv(-100) }
    @data = [
      { name: "Moyenne Zappit!", data: all_user_data_formated },
      { name: "Vos Abonnements", data: user_data_formated }
    ].to_json
  end

def chartsshow
    subscription = Subscription.find(params[:id])
    user = current_user
    all_user_data = Operation.group_by_month(:date).where(subscription: subscription).sum(:amount_cents)
    all_user_data_formated = all_user_data.each { |date, amount| all_user_data[date] = (amount.fdiv(-100)).fdiv(User.count) }
    user_data = Operation.where(user: user).group_by_month(:date).where.not(subscription: nil).sum(:amount_cents)
    user_data_formated = user_data.each { |date, amount| user_data[date] = amount.fdiv(-100) }
    @data_show = [
      { name: "Moyenne Zappit!", data: all_user_data_formated },
      { name: "Vos Abonnements", data: user_data_formated }
    ].to_json
  end

end
