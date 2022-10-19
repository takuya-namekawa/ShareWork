class Managements::SessionsController < Devise::SessionsController
  def guest_sign_in
    management = Management.guest
    sign_in management
    redirect_to posts_path, notice: 'guestmanagementでログインしました。'
  end
end