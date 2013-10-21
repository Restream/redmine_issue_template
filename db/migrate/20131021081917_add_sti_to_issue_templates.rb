class AddStiToIssueTemplates < ActiveRecord::Migration
  def change
    add_column :issue_templates, :type, :string
    add_index :issue_templates, :type
  end
end
