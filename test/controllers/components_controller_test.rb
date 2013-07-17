require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase

  test "components can be updated with a POST request" do
    component = components('one')
    component.status = 'down'
    put :repaired, {id: component.id, format: :json}
    assert_response :success
    assert_equal 'up', assigns(:component).status
  end

end
