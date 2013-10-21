require File.expand_path('../../test_helper', __FILE__)

class IssueTemplatePermissionsTest < ActiveSupport::TestCase
  def test_issue_template_permissions
    assert Redmine::AccessControl.permission(:manage_project_issue_templates)
  end
end
