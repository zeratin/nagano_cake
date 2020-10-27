class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @order = Order.where(created_at: 0.day.ago.all_day).count
  end

end
