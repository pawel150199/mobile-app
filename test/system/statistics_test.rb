require "application_system_test_case"

class StatisticsTest < ApplicationSystemTestCase
  setup do
    @statistic = statistics(:one)
  end

  test "visiting the index" do
    visit statistics_url
    assert_selector "h1", text: "Statistics"
  end

  test "creating a Statistic" do
    visit statistics_url
    click_on "New Statistic"

    fill_in "Answer", with: @statistic.answer_id
    check "Pointer" if @statistic.pointer
    fill_in "Question", with: @statistic.question_id
    fill_in "User", with: @statistic.user_id
    click_on "Create Statistic"

    assert_text "Statistic was successfully created"
    click_on "Back"
  end

  test "updating a Statistic" do
    visit statistics_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @statistic.answer_id
    check "Pointer" if @statistic.pointer
    fill_in "Question", with: @statistic.question_id
    fill_in "User", with: @statistic.user_id
    click_on "Update Statistic"

    assert_text "Statistic was successfully updated"
    click_on "Back"
  end

  test "destroying a Statistic" do
    visit statistics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Statistic was successfully destroyed"
  end
end
