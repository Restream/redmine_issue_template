class ProjectIssueTemplate < IssueTemplateBase
  belongs_to :project

  validates :project, :presence => true
end
