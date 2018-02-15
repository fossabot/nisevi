# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.page(params[:page]).per(6)
  end

  def show; end

  def new
    @service = Service.new
  end

  def edit; end

  def create
    @service = Service.new(service_params.merge(user: current_user))
    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_url, notice: 'Service was successfully destroyed.'
  end

  private

  def set_service
    @service = Service.find_by_slug!(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :content, :active)
  end
end
