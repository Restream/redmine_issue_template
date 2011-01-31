class IssueTemplate < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
end

