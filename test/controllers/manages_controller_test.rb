require "test_helper"

class ManagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manage = manages(:one)
  end

  test "should get index" do
    get manages_url, as: :json
    assert_response :success
  end

  test "should create manage" do
    assert_difference('Manage.count') do
      post manages_url, params: { manage: { date: @manage.date, description: @manage.description, title: @manage.title, user_id: @manage.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show manage" do
    get manage_url(@manage), as: :json
    assert_response :success
  end

  test "should update manage" do
    patch manage_url(@manage), params: { manage: { date: @manage.date, description: @manage.description, title: @manage.title, user_id: @manage.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy manage" do
    assert_difference('Manage.count', -1) do
      delete manage_url(@manage), as: :json
    end

    assert_response 204
  end
end
