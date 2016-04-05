require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template "snippets/index"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", new_snippet_path
    assert_select "a[href=?]", about_path
    assert_select "a:match('href', ?)", /[\Ah].+github.+[\ze]/
    get new_snippet_path
    assert_template "snippets/new"
    assert_select "title", full_title("Create snippet")
  end
  
end
