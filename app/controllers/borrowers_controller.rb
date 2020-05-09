class BorrowersController < ApplicationController
 
  # GET /borrowers
  def index
    @borrowers = Borrower.all

    render json: @borrowers
  end

  # GET /borrowers/1
  def show
    @borrower = Borrower.find(params[:id])
    render json: @borrower.to_json(include: :application)
  end

  # POST /borrowers
  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      render json: @borrower, status: :created, location: @borrower
    else
      render json: @borrower.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /borrowers/1
  def update
    if @borrower.update(borrower_params)
      render json: @borrower
    else
      render json: @borrower.errors, status: :unprocessable_entity
    end
  end

  # DELETE /borrowers/1
  def destroy
    @borrower.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_borrower
    #   @borrower = Borrower.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def borrower_params
      params.require(:borrower).permit(:name, :state, :business_segment, :relationship_mgr_id)
    end
end
