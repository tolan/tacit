class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.uniq_subscriptions
    @user = current_user
    chartindex
  end

  def show
    @foo = 'bar'

    #google cal items duplicate
    @test_variable = 'Rapel: Abonnement Axa Auto'
    @renewal_date = " 2020-06-06"
    @today = Date.today

    #other items
    @user = current_user
    @subscription = Subscription.find(params[:id])
    @last_month_share = @subscription.last_month_spent.to_f / @user.last_month_spent.to_f
    chartsshow
    @operator = @subscription.operator
    @community_coverage = User.joins(operations: { subscription: :operator }).where('subscriptions.operator_id = ?', @operator.id).distinct.count.to_f / User.count.to_f
  end

  private

  def subscription_params
    params.require(:subscription).permit(:operator_id)
  end

  def chartsshow
      subscription = Subscription.find(params[:id])
      operator = subscription.operator.name
      user = current_user
      all_user_data = Operation.joins(subscription: :operator).group_by_month(:date).where("operators.name = ?", operator ).where("amount_cents < -1").average("operations.amount_cents / -100")
      all_user_data_formated = all_user_data.each { |date, amount| all_user_data[date] = amount.to_f }.select { |date, amount| amount != 0 }
      user_data = Operation.group_by_month(:date).where(subscription: subscription).where("amount_cents < -1").sum(:amount_cents)
      user_data_formated = user_data.each { |date, amount| user_data[date] = amount.fdiv(-100) }.select{ |date, amount| amount != 0 }
      @datashow = [
        { name: "Moyenne Zappit!", data: all_user_data_formated },
        { name: "Vos Abonnements", data: user_data_formated }
      ].to_json
    end

  def chartindex
    user = current_user
    all_user_data = Operation.group_by_month(:date).where.not(subscription: nil).where("amount_cents < -1").sum(:amount_cents)
    all_user_data_formated = all_user_data.each { |date, amount| all_user_data[date] = (amount.fdiv(-100)).fdiv(User.count) }.select{ |date, amount| amount != 0 }
    user_data = Operation.group_by_month(:date).where(user: user).where("amount_cents < -1").where.not(subscription: nil).sum(:amount_cents)
    user_data_formated = user_data.each { |date, amount| user_data[date] = amount.fdiv(-100) }.select{ |date, amount| amount != 0 }
    @dataindex = [
      { name: "Moyenne Zappit!", data: all_user_data_formated },
      { name: "Vos Abonnements", data: user_data_formated }
    ].to_json
  end
    # query = <<-SQL
    #   SELECT COUNT(DISTINCT u.id) as total, (date_trunc('month', o.date::date)) as month
    #   FROM users u
    #   JOIN operations o ON o.user_id = u.id
    #   WHERE o.subscription_id IS NOT NULL
    #   GROUP BY month
    # SQL

    # user_active = ActiveRecord::Base.connection.execute(query)

    # expenses = Operation.group_by_month(:date).where.not(subscription: nil).where("amount_cents < -1").sum("amount_cents / -100")
    # # user_active = Operation.group_by_month(operation.date).where.not(subscription: nil).where("amount_cents < -1").sum("amount_cents / -100")
    # all_user_data = exenses.fdiv(user_active).group_by_month
    # all_user_data_formated = all_user_data.each { |date, amount| all_user_data[date] = amount.to_f }.select { |date, amount| amount != 0 }
    # user_data = Operation.group_by_month(:date).where(user: user).where("amount_cents < -1").where.not(subscription: nil).sum(:amount_cents)
    # user_data_formated = user_data.each { |date, amount| user_data[date] = amount.fdiv(-100) }.select { |date, amount| amount != 0 }
    # @dataindex = [
    #   { name: "Moyenne Zappit!", data: all_user_data_formated },
    #   { name: "Vos Abonnements", data: user_data_formated }
    # ].to_json
end
