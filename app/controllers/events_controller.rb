class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @event = Event.all
  end

  def new
  end

  def create
    date = Date.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @event = Event.new(user_id: current_user.id, start_date: date, duration: params[:duration].to_i, title: params[:title], description: params[:description], price: params[:event][:price], location: params[:location])
    if @event.save
      redirect_to root_url
    else 
      redirect_to new_event_url
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.user_id)
    @attendance = Attendance.find_by(event_id: params[:id], user_id: current_user.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    date = Date.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    if @event.update(user_id: current_user.id, start_date: date, duration: params[:duration].to_i, title: params[:title], description: params[:description], price: params[:event][:price], location: params[:location])
      redirect_to event_path(@event.id)
    else
      redirect_to edit_event_path(@event.id)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end
end
