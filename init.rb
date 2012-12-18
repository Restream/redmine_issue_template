require 'redmine'

Redmine::Plugin.register :redmine_issue_template do
  name 'Redmine Issue Template'
  author 'undev.ru'
  description 'Allows to manage templates of issues, and adding them to issue body'
  version '0.0.1'
  url 'http://undev.ru'
  author_url 'http://undev.ru'

  # Icon source: vendor/plugins/redmine_issue_template
  # http://www.famfamfam.com/lab/icons/silk/
  icon = "/plugin_assets/redmine_issue_template/images/page_white_paste.png"
  plugin_menu_html = {
    :style => "background-image: url(#{icon})"
  }
  menu(:admin_menu, :issue_templates, {
    :controller => 'issue_templates',
    :action => 'index'
  }, :html => plugin_menu_html)
end

ApplicationHelper.send(:include, IssueTemplatesHelper)
require 'redmine_issue_template/hooks/view_issues_form_details_bottom_hook'
