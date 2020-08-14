class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def ticket_params
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
