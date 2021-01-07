class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_employer, only: %i[update destroy]

  def check_employer
    if resouce.email == 'employer@example.com'
      redirect_to user_home_path
    end
  end
end