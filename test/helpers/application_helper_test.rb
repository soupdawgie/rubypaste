require 'test_helper'

class SnippetTest < ActiveSupport::TestCase

  test "full title helper" do
    title = "Test page"
    assert full_title(title), "Test page | Rubypaste"
  end
  
end
