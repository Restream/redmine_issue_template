require 'redmine'

Redmine::Plugin.register :redmine_issue_template do
  name 'Redmine Issue Template'
  author 'undev.ru'
  description 'Allows to manage templates of issues, and adding them to issue body'
  version '0.0.1'
  url 'http://undev.ru'
  author_url 'http://undev.ru'
  menu :admin_menu, :issue_templates, { :controller => 'issue_templates', :action => 'index' }
end


ApplicationHelper.send(:include, IssueTemplatesHelper)
require 'redmine_issue_template/hooks/view_issues_form_details_bottom_hook'


