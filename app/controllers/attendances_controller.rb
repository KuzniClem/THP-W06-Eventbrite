class AttendancesController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  Attendance.create(user_id: current_user.id, event_id: params[:event_id], stripe_customer_id: Stripe::Customer.retrieve(customer.id))
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_event_attendance_path
  end
end
