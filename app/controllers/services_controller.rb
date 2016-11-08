class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = Kaminari.paginate_array(policy_scope(Service))
                        .page(params[:page]).per(4)
  end

  # GET /services/1
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    authorize @service
  end

  # GET /services/1/edit
  def edit
    authorize @service
  end

  # POST /services
  def create
    @service = Service.new(service_params.merge(user: current_user))
    authorize @service
    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    authorize @service
    if @service.update(service_params)
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /services/1
  def destroy
    authorize @service
    @service.destroy
    redirect_to services_url, notice: 'Service was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find_by_slug!(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.require(:service).permit(:title,  :description, :content,  :active)
    end
end
