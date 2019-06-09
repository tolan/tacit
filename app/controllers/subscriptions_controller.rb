class SubscriptionsController < ApplicationController

  def index
    @user = current_user
    @subscriptions = @user.subscriptions
  end

  def show
    @subscription = Subscription.find(params(:subscription_id))
  end

  private

  def subscription_params
    params.require(:subscription).permit(:operator_id)
  end
end
