require_dependency 'application_controller'

module RedmineIssueTemplate::Patches::ApplicationControllerPatch
  extend ActiveSupport::Concern

  included do
    before_filter :include_issue_templates_helper
  end

  # A way to make plugin helpers available in all views
  def include_issue_templates_helper
    unless _helpers.included_modules.include? IssueTemplatesHelper
      self.class.helper IssueTemplatesHelper
    end
    true
  end
end

unless ApplicationController.included_modules.include? RedmineIssueTemplate::Patches::ApplicationControllerPatch
  ApplicationController.send :include, RedmineIssueTemplate::Patches::ApplicationControllerPatch
end
