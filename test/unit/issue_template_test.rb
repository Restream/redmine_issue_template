require File.expand_path('../../test_helper', __FILE__)

class IssueTemplateTest < ActiveSupport::TestCase
  def test_issue_template_create
    title = 'test title'
    content = 'test content'
    template = IssueTemplate.new(:title => title, :content => content)
    assert template.save
    template = IssueTemplate.last
    assert_equal title, template.title
    assert_equal content, template.content
  end
end
