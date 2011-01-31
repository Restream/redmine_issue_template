module IssueTemplatesHelper
  def issue_templates_options
    options_from_collection_for_select(IssueTemplate.all, 'content', 'title')
  end
end

