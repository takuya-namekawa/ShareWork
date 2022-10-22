class Management::ManagementsController < ApplicationController
  before_action :authenticate_management!

  def show
    @management = current_management
    @shops = Shop.all
    @managements = Management.all
  end

  def update
    @management = current_management
    @management.update(management_params)
    redirect_to my_page_management_managements_path
  end

  def edit
    @management = current_management
  end

  private

  def management_params
    params.require(:management).permit(:name, :email, :profile_image, :job)
  end

end
