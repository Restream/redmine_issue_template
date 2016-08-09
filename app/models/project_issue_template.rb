class ProjectIssueTemplate < IssueTemplate
  acts_as_list scope: :project_id

  validates :project, presence: true

  belongs_to :project
end
