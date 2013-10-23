class FillStiTypesForIssueTemplates < ActiveRecord::Migration
  def up
    IssueTemplate.update_all :type => 'GlobalIssueTemplate'
  end

  def down
  end
end
