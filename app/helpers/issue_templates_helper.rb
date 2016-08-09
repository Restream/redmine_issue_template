module IssueTemplatesHelper
  def issue_templates_options
    if @project.module_enabled? :project_issue_templates
      project_and_glogal_issue_templates_options
    else
      global_issue_templates_options
    end
  end

  def project_and_glogal_issue_templates_options
    templates = []

    templates << [
      l(:label_project_issue_templates),
      @project.issue_templates.by_position.map { |t| [t.title, t.content] }
    ] if @project.issue_templates.any?

    templates << [
      l(:label_global_issue_templates),
      GlobalIssueTemplate.by_position.map { |t| [t.title, t.content] }
    ] if GlobalIssueTemplate.any?

    grouped_options_for_select(templates)
  end

  def global_issue_templates_options
    options_from_collection_for_select(
      GlobalIssueTemplate.by_position, 'content', 'title')
  end
end

