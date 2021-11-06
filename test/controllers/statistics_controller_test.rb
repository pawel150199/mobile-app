require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statistic = statistics(:one)
  end

  test "should get index" do
    get statistics_url
    assert_response :success
  end

  test "should get new" do
    get new_statistic_url
    assert_response :success
  end

  test "should create statistic" do
    assert_difference('Statistic.count') do
      post statistics_url, params: { statistic: { answer_id: @statistic.answer_id, pointer: @statistic.pointer, question_id: @statistic.question_id, user_id: @statistic.user_id } }
    end

    assert_redirected_to statistic_url(Statistic.last)
  end

  test "should show statistic" do
    get statistic_url(@statistic)
    assert_response :success
  end

  test "should get edit" do
    get edit_statistic_url(@statistic)
    assert_response :success
  end

  test "should update statistic" do
    patch statistic_url(@statistic), params: { statistic: { answer_id: @statistic.answer_id, pointer: @statistic.pointer, question_id: @statistic.question_id, user_id: @statistic.user_id } }
    assert_redirected_to statistic_url(@statistic)
  end

  test "should destroy statistic" do
    assert_difference('Statistic.count', -1) do
      delete statistic_url(@statistic)
    end

    assert_redirected_to statistics_url
  end
end
