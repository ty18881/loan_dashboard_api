class RelationshipMgrsController < ApplicationController
  
## application will only permit viewing all RMs or an individual RMs
## no edits from the GUI.
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


end
