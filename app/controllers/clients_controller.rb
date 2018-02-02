class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
    @clients = Client.all
    @client = Client.new
  end

  def new; end

  def create
    @client = Client.create(client_params)
    render :new unless @client.save
  end

  def show; end

  def edit; end

  def update
    render :edit unless @client.update(client_params)
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit!
  end
end
