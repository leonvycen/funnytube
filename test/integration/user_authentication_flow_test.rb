require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest
  test "user able to signup" do
    get '/signup'
    assert_response :success

    post '/users', params: { user: {email: 'user1@sample.com', password: '123456'}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "span", "user1@sample.com"
  end

  test "user able to signin with correct password" do
    User.create(email: 'user2@sample.com', password: 'passwordtest')

    get '/signin'
    assert_response :success

    post '/signin', params: {email: 'user2@sample.com', password: 'passwordtest'}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "span", "user2@sample.com"
  end
end
