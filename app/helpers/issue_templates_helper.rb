module IssueTemplatesHelper
  def issue_templates_options
    templates = []

    templates << [
        l(:label_project_issue_templates),
        @project.issue_templates.by_position.map { |t| [t.content, t.title] }
    ] if @project.issue_templates.any?

    templates << [
        l(:label_global_issue_templates),
        GlobalIssueTemplate.by_position.map { |t| [t.content, t.title] }
    ] if GlobalIssueTemplate.any?

    grouped_options_for_select(templates)
  end
end

