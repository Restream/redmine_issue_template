class IssueTemplateBase < ActiveRecord::Base
  self.table_name = "#{table_name_prefix}issue_templates#{table_name_suffix}"

  attr_accessible :title, :content

  validates :title, :presence => true
  validates :content, :presence => true
end

