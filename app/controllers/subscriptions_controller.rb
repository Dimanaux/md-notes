class SubscriptionsController < ApplicationController
  expose :subscription, parent: :current_user

  before_action :authenticate_user!

  def create
    subscription.save

    respond_with subscription, location: user_path(subscription.followee)
  end

  def destroy
    subscription.destroy

    respond_with subscription, location: user_path(subscription.followee)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:followee_id)
  end
end
