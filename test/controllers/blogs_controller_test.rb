require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test 'should get index' do
    get blogs_url
    assert_response :success
  end

  test 'should show blog' do
    get blog_url(@blog)
    assert_response :success
  end
end
