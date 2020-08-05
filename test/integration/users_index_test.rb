require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ren)
    @other_user = users(:archer)
  end
  
  test "ユーザー一覧のページネーションを確認" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination' , count: 2
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
  
  test "Usersインデックスに非ログインユーザーがアクセスした場合" do
    get users_path
    assert_redirected_to login_url
  end
  
  test "admin属性の変更が出来ないことを確認する" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password: "password",
                                            password_confirmation: "password",
                                            admin: true}}
    assert_not @other_user.reload.admin?
  end
  
  test '非ログイン状態でuserを削除しようとした場合' do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end
end
