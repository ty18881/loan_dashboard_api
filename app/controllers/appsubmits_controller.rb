class AppsubmitsController < ApplicationController
  before_action :set_appsubmit, only: [:show, :update, :destroy]

  # GET /appsubmits
  def index
    # @appsubmits = Appsubmit.all
    @appsubmits = Appsubmit.select(:submit_date).group(:submit_date).count

    render json: @appsubmits
  end

  # GET /appsubmits/1
  def show
    render json: @appsubmit
  end

  # POST /appsubmits
  def create
    @appsubmit = Appsubmit.new(appsubmit_params)

    if @appsubmit.save
      render json: @appsubmit, status: :created, location: @appsubmit
    else
      render json: @appsubmit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appsubmits/1
  def update
    if @appsubmit.update(appsubmit_params)
      render json: @appsubmit
    else
      render json: @appsubmit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appsubmits/1
  def destroy
    @appsubmit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appsubmit
      @appsubmit = Appsubmit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appsubmit_params
      params.require(:appsubmit).permit(:submit_date, :count)
    end
end
