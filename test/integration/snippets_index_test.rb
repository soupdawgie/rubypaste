require 'test_helper'

class SnippetsIndexTest < ActionDispatch::IntegrationTest

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
    end
  end

end
