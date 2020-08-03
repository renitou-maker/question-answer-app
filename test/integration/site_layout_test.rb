require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "非ログイン時のレイアウトリンク確認" do
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", '/about'
    assert_select "a[href=?]", '/contact'
    assert_select "a[href=?]", login_path
  end
  
  def setup
    @user = users(:ren)
  end
  
  test "ログイン時のレイアウトリンク確認" do
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", login_path, count: 0
  end
  
end
