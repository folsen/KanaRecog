require 'test_helper'

class HighscoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highscore" do
    assert_difference('Highscore.count') do
      post :create, :highscore => { }
    end

    assert_redirected_to highscore_path(assigns(:highscore))
  end

  test "should show highscore" do
    get :show, :id => highscores(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => highscores(:one).to_param
    assert_response :success
  end

  test "should update highscore" do
    put :update, :id => highscores(:one).to_param, :highscore => { }
    assert_redirected_to highscore_path(assigns(:highscore))
  end

  test "should destroy highscore" do
    assert_difference('Highscore.count', -1) do
      delete :destroy, :id => highscores(:one).to_param
    end

    assert_redirected_to highscores_path
  end
end
