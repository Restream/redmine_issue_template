module RedmineIssueTemplate
end

require 'redmine_issue_template/hooks/view_issues_form_details_bottom_hook'
require 'redmine_issue_template/patches/project_patch'

# include IssueTemplatesHelper
require 'redmine_issue_template/patches/application_controller_patch'
