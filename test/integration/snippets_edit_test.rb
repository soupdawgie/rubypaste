require 'test_helper'

class SnippetsEditTest < ActionDispatch::IntegrationTest

  def setup
    @one = snippets(:one)
  end

  test "unsuccessful edit" do
    get edit_snippet_path(@one)
    assert_template "snippets/edit"
    patch snippet_path(@one), snippet: { title: "", code: "" }
    assert_template "snippets/edit"
    assert_select "div#error_explanation"
    assert_select "div#error_explanation>ul>li", count: 1
  end

  test "successful edit" do
    get edit_snippet_path(@one)
    title = "new title"
    code  = "new code"
    patch snippet_path(@one), snippet: { title: title, code: code }
    assert_redirected_to @one
    assert_not flash.empty?
    @one.reload
    assert @one.title, title
    assert @one.code, code
  end

end
