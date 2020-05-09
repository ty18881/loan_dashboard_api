require 'test_helper'

class AppsubmitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appsubmit = appsubmits(:one)
  end

  test "should get index" do
    get appsubmits_url, as: :json
    assert_response :success
  end

  test "should create appsubmit" do
    assert_difference('Appsubmit.count') do
      post appsubmits_url, params: { appsubmit: { count: @appsubmit.count, submit_date: @appsubmit.submit_date } }, as: :json
    end

    assert_response 201
  end

  test "should show appsubmit" do
    get appsubmit_url(@appsubmit), as: :json
    assert_response :success
  end

  test "should update appsubmit" do
    patch appsubmit_url(@appsubmit), params: { appsubmit: { count: @appsubmit.count, submit_date: @appsubmit.submit_date } }, as: :json
    assert_response 200
  end

  test "should destroy appsubmit" do
    assert_difference('Appsubmit.count', -1) do
      delete appsubmit_url(@appsubmit), as: :json
    end

    assert_response 204
  end
end
