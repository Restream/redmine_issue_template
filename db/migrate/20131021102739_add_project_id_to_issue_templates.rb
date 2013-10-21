class AddProjectIdToIssueTemplates < ActiveRecord::Migration
  def change
    add_column :issue_templates, :project_id, :integer
    add_index :issue_templates, [:type, :project_id]
  end
end
