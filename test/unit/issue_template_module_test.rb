require File.expand_path('../../test_helper', __FILE__)

class IssueTemplateModuleTest < ActiveSupport::TestCase
  def test_issue_template_module
    modules = Redmine::AccessControl.available_project_modules
    assert modules.include?(:project_issue_templates)
  end
end
