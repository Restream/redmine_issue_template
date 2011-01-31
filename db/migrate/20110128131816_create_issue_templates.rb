class CreateIssueTemplates < ActiveRecord::Migration
  def self.up
    create_table :issue_templates do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :issue_templates
  end
end
