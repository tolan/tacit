class BridgesController < ApplicationController

  def create_new_item_link
    #TA.question: current_user?
    @bridge_api_url = Bridge::Items::Connect.call(current_user)
  end
end




