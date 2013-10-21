require_dependency 'project'

module RedmineIssueTemplate::Patches::ProjectPatch
  extend ActiveSupport::Concern

  included do
    has_many :issue_templates, :class_name => 'ProjectIssueTemplate'
  end
end

unless Project.included_modules.include? RedmineIssueTemplate::Patches::ProjectPatch
  Project.send :include, RedmineIssueTemplate::Patches::ProjectPatch
end
