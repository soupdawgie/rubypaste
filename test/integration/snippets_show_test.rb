require 'test_helper'

class SnippetsShowTest < ActionDispatch::IntegrationTest

  def setup
    @one = snippets(:one)
  end

  test "snippets show layout" do
    get snippet_path(@one)
    assert_template "snippets/show"
    assert_select "h3", @one.title
    assert_select "a[href=?]", snippet_path(@one), text: @one.title, count: 0
    assert_select "a[href=?]", edit_snippet_path(@one)
    assert_select "a[data-clipboard-text=?]", snippet_url(@one)
    assert_select "a[data-method=?]", "delete"
    assert_select "div.code", @one.code
    assert_select "li", "Created #{count_time(@one)} ago"
    assert_select "li", "Chars: #{count_code(@one)}"
    assert_select "li", "Lines: #{count_lines(@one)}"
  end

end
