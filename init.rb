Redmine::Plugin.register :redmine_issue_template do
  name 'Redmine Issue Template Plugin'
  author 'Restream'
  description 'This plugin enables you to manage templates of issues and add them to issue descriptions.'
  version '1.0.6'
  url 'https://github.com/Restream/redmine_issue_template'
  author_url 'https://github.com/Restream'

  requires_redmine version_or_higher: '2.1.0'

  # Icon source: vendor/plugins/redmine_issue_template
  # http://www.famfamfam.com/lab/icons/silk/
  icon = '/plugin_assets/redmine_issue_template/images/page_white_paste.png'
  plugin_menu_html = {
    style: "background-image: url(#{icon})"
  }
  menu(:admin_menu, :issue_templates, {
    controller: 'global_issue_templates',
    action: 'index'
  }, html: plugin_menu_html)

  project_module :project_issue_templates do
    permission :manage_project_issue_templates,
               { project_issue_templates: [:new, :create, :edit, :update, :destroy] },
               require: :member
  end
end

require 'redmine_issue_template'
