require File.expand_path('../../test_helper', __FILE__)

class ProjectIssueTemplateTest < ActiveSupport::TestCase
  fixtures :projects,
    :users,
    :roles,
    :members,
    :member_roles,
    :issues,
    :issue_statuses,
    :versions,
    :trackers,
    :projects_trackers,
    :issue_categories,
    :enabled_modules,
    :enumerations

  def test_issue_template_create
    title    = 'test title'
    content  = 'test content'
    project  = Project.find(1)
    template = project.issue_templates.build(title: title, content: content)
    assert template.save
    template = ProjectIssueTemplate.last
    assert_equal title, template.title
    assert_equal content, template.content
    assert_equal project, template.project
  end
end
