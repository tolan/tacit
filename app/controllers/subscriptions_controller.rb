class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.uniq_subscriptions
    @user = current_user
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  private

  def subscription_params
    params.require(:subscription).permit(:operator_id)
  end
end
