class FillStiTypesForIssueTemplates < ActiveRecord::Migration
  def up
    IssueTemplate.update_all :type => 'IssueTemplate'
  end

  def down
  end
end
