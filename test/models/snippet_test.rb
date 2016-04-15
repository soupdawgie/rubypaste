require 'test_helper'

class SnippetTest < ActiveSupport::TestCase

  def setup
    @snippet       = Snippet.new(title: "text", code: "some code")
    @other_snippet = Snippet.create(title: "t", code: "c")
  end

  test "should be valid" do
    assert @snippet.valid?
  end

  test "code should be present" do
    @snippet.code = nil
    assert_not @snippet.valid?
  end

  test "token generated after save" do
    @snippet.save
    assert_not @snippet.token.nil?
  end

  test "token should be unique" do
    @snippet.save
    assert_raises ActiveRecord::RecordNotUnique do
      @other_snippet.update_attributes(token: @snippet.token)
    end
  end

  test "title should be set automatically if nil" do
    @snippet.title = nil
    @snippet.save
    assert @snippet.title, Time.now
  end

end
