class Users::PasswardsController < Devise::PasswardsController
  before_action :check_employer, only: :create

  def check_employer
    if params[:user][:email].downcase == 'employer@example.com'
      redirect_to user_homes_home_path
    end
  end
end