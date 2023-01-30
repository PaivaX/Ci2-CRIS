require "test_helper"

class ProjectTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = Project.new
    assert_not Project.save
  end
  
end
