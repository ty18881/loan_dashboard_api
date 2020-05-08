require 'test_helper'

class BorrowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrower = borrowers(:one)
  end

  test "should get index" do
    get borrowers_url, as: :json
    assert_response :success
  end

  test "should create borrower" do
    assert_difference('Borrower.count') do
      post borrowers_url, params: { borrower: { business_segment: @borrower.business_segment, name: @borrower.name, state: @borrower.state } }, as: :json
    end

    assert_response 201
  end

  test "should show borrower" do
    get borrower_url(@borrower), as: :json
    assert_response :success
  end

  test "should update borrower" do
    patch borrower_url(@borrower), params: { borrower: { business_segment: @borrower.business_segment, name: @borrower.name, state: @borrower.state } }, as: :json
    assert_response 200
  end

  test "should destroy borrower" do
    assert_difference('Borrower.count', -1) do
      delete borrower_url(@borrower), as: :json
    end

    assert_response 204
  end
end
