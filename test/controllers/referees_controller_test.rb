require "test_helper"

class RefereesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referee = referees(:one)
  end

  test "should get index" do
    get referees_url
    assert_response :success
  end

  test "should get new" do
    get new_referee_url
    assert_response :success
  end

  test "should create referee" do
    assert_difference('Referee.count') do
      post referees_url, params: { referee: { fide_id: @referee.fide_id, name: @referee.name, title: @referee.title } }
    end

    assert_redirected_to referee_url(Referee.last)
  end

  test "should show referee" do
    get referee_url(@referee)
    assert_response :success
  end

  test "should get edit" do
    get edit_referee_url(@referee)
    assert_response :success
  end

  test "should update referee" do
    patch referee_url(@referee), params: { referee: { fide_id: @referee.fide_id, name: @referee.name, title: @referee.title } }
    assert_redirected_to referee_url(@referee)
  end

  test "should destroy referee" do
    assert_difference('Referee.count', -1) do
      delete referee_url(@referee)
    end

    assert_redirected_to referees_url
  end
end
