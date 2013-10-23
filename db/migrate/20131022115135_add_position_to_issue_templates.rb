class AddPositionToIssueTemplates < ActiveRecord::Migration
  def change
    add_column :issue_templates, :position, :integer
  end
end
