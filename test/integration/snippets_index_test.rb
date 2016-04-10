require 'test_helper'

class SnippetsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @one = snippets(:one)
  end

  test "index including pagination and delete links" do
    get snippets_path
    assert_template "snippets/index"
    assert_select "div.pagination"
    first_page = Snippet.paginate(page: 1, per_page: 10)
    first_page.each do |snippet|
      assert_select "a[href=?]", snippet_path(snippet), text: snippet.title
      assert_select "a[href=?]", edit_snippet_path(snippet)
      assert_select "a[data-clipboard-text=?]", snippet_url(snippet)
      assert_select "a[data-method=?]", "delete"
      assert_select "div.code"
      assert_select "div.stats>li", snippet.chars
      assert_select "div.stats>li", snippet.lines
    end
    assert_difference "Snippet.count", -1 do
      delete snippet_path(@one)
    end
  end

end
