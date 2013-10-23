module RedmineIssueTemplate
end

require 'redmine_issue_template/hooks/view_hook'
require 'redmine_issue_template/patches/project_patch'
require 'redmine_issue_template/patches/projects_helper_patch'

# include IssueTemplatesHelper
require 'redmine_issue_template/patches/application_controller_patch'
