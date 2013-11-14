module RedmineIssueTemplate::Hooks
  class ViewHook < Redmine::Hook::ViewListener
    render_on :view_issues_form_details_bottom,
              :partial => 'issue_templates/issue_template_control'

    def view_layouts_base_html_head(context = {})
      stylesheet_link_tag('issue_templates.css', :plugin => 'redmine_issue_template') +
      javascript_include_tag('issue_templates.js', :plugin => 'redmine_issue_template')
    end
  end
end
