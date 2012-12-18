class IssueTemplate < ActiveRecord::Base
  attr_accessible :title, :content

  validates_presence_of :title
  validates_presence_of :content
end

