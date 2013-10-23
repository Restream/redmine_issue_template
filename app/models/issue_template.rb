class IssueTemplate < ActiveRecord::Base
  #attr_accessible :title, :content

  validates :title, :presence => true
  validates :content, :presence => true

  scope :by_position, order("#{table_name}.position")
end

