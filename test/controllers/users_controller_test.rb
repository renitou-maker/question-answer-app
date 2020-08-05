require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ren)
    @other_user = users(:archer)
  end
  
  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get index" do
    log_in_as(@user)
    get users_path
    assert_response :success
  end
  
  test "非ログイン状態でユーザー編集を行おうとした時の動作" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "非ログイン状態でアップデートを行おうとした時の動作" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "ユーザーが、別のユーザーの編集ページにアクセスした時" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "ユーザーが別のユーザーの情報をアップデートしようとした時" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email}}
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  # test 'ログイン中のユーザーとは異なるidのユーザーにはdeleteボタンが表示されない' do
  #   log_in_as(@other_user)
  #   get users_path
  #   assert_select "a[href=?]", DELETE_path,count: 1
  # end
  
  
  
end
