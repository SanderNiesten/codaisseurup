class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registrations = current_user.registrations.create(registration_params)

    redirect_to @registration.event, notice: "Thank you for regeristing!"
  end

  private

  def registration_params
    params.require(:registration).permit(:status, :price, :guests_count, :total, :event_id)
  end
end
