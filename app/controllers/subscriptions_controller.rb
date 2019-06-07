class SubscriptionsController < ApplicationController

  def index
    @user = current_user
    @subscriptions = Subscription.where(user_id: current_user.id)
  end

  def show
    @subscription = Subscription.find(params(:subscription_id))
  end

  private

  def subscription_params
    params.require(:subscription).permit(:operator_id)
  end
end
