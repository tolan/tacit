class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.subscriptions

  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  private

  def subscription_params
    params.require(:subscription).permit(:operator_id)
  end
end
