class IssueTemplate < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  scope :by_position, -> { order("#{table_name}.position") }
end

