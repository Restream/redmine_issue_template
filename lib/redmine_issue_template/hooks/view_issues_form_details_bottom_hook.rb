module RedmineIssueTemplate
  module Hooks
    class ViewIssuesFormDetailsBottomHook < Redmine::Hook::ViewListener
      render_on(:view_issues_form_details_bottom, :partial => 'issue_templates/issue_template_control', :layout => false)
    end
  end
end
