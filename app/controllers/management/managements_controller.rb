class Management::ManagementsController < ApplicationController
  def show
    @management = current_management
  end

  def edit
    @management = current_management
  end
end
