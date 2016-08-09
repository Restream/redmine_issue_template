require File.expand_path('../../test_helper', __FILE__)

class GlobalIssueTemplateTest < ActiveSupport::TestCase
  def test_issue_template_create
    title    = 'test title'
    content  = 'test content'
    template = GlobalIssueTemplate.new(title: title, content: content)
    assert template.save
    template = GlobalIssueTemplate.last
    assert_equal title, template.title
    assert_equal content, template.content
  end
end
