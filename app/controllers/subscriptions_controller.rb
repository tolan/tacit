class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.uniq_subscriptions
    @user = current_user
  end

  def show
    @user = current_user
    @subscription = Subscription.find(params[:id])
    @last_month_share = @subscription.last_month_spent.to_f / @user.last_month_spent.to_f
  end

  private

  def subscription_params
    params.require(:subscription).permit(:operator_id)
  end
end
