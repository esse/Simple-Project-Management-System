require File.join(File.dirname(__FILE__), 'setup_test')

class UsersController < ActionController::Base
  def index
    render( :text => "test" )
  end
end

class BaseAuthTest < Test::Unit::TestCase
  def setup
    @controller = UsersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get( :index )
    assert_response( :success )
  end
end
