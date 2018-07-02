class EmployeesController < ApplicationController
  def dashboard
    @orders = Order.confirmed
  end
end
