class RelationshipMgrsController < ApplicationController
  

  # GET /relationship_mgrs
  def index
    @relationship_mgrs = RelationshipMgr.all

    render json: @relationship_mgrs
  end

  # GET /relationship_mgrs/1
  def show
    @relationship_mgr = RelationshipMgr.find(params[:id])
    render json: @relationship_mgr.to_json(include: :borrowers)
  end

  # POST /relationship_mgrs
  def create
    @relationship_mgr = RelationshipMgr.new(relationship_mgr_params)

    if @relationship_mgr.save
      render json: @relationship_mgr, status: :created, location: @relationship_mgr
    else
      render json: @relationship_mgr.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /relationship_mgrs/1
  def update
    if @relationship_mgr.update(relationship_mgr_params)
      render json: @relationship_mgr
    else
      render json: @relationship_mgr.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relationship_mgrs/1
  def destroy
    @relationship_mgr.destroy
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_relationship_mgr
    #   @relationship_mgr = RelationshipMgr.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def relationship_mgr_params
      params.require(:relationship_mgr).permit(:name, :state, :employee_id)
    end
end
