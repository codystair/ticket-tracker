class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_session, except: [:show, :index]
  
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = 'Your ticket was updated.'
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, tag_ids: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
