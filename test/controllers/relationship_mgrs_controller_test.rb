require 'test_helper'

class RelationshipMgrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relationship_mgr = relationship_mgrs(:one)
  end

  test "should get index" do
    get relationship_mgrs_url, as: :json
    assert_response :success
  end

  test "should create relationship_mgr" do
    assert_difference('RelationshipMgr.count') do
      post relationship_mgrs_url, params: { relationship_mgr: { employee_id: @relationship_mgr.employee_id, name: @relationship_mgr.name, state: @relationship_mgr.state } }, as: :json
    end

    assert_response 201
  end

  test "should show relationship_mgr" do
    get relationship_mgr_url(@relationship_mgr), as: :json
    assert_response :success
  end

  test "should update relationship_mgr" do
    patch relationship_mgr_url(@relationship_mgr), params: { relationship_mgr: { employee_id: @relationship_mgr.employee_id, name: @relationship_mgr.name, state: @relationship_mgr.state } }, as: :json
    assert_response 200
  end

  test "should destroy relationship_mgr" do
    assert_difference('RelationshipMgr.count', -1) do
      delete relationship_mgr_url(@relationship_mgr), as: :json
    end

    assert_response 204
  end
end
