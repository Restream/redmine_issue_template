module RedmineIssueTemplate::Patches::ProjectsHelperPatch
  extend ActiveSupport::Concern

  included do
    alias_method_chain :project_settings_tabs, :templates_tab
  end

  def project_settings_tabs_with_templates_tab
    tabs = project_settings_tabs_without_templates_tab

    # check permissions
    if User.current.allowed_to?(:manage_project_issue_templates, @project)
      tabs << {
        name:       'issue_templates',
        controller: 'project_issue_templates',
        action:     :manage_project_issue_templates,
        partial:    'project_issue_templates/index',
        label:      :label_issue_templates
      }
    end

    tabs
  end
end

unless ProjectsHelper.included_modules.include?(RedmineIssueTemplate::Patches::ProjectsHelperPatch)
  ProjectsHelper.send :include, RedmineIssueTemplate::Patches::ProjectsHelperPatch
end

