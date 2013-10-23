class ProjectIssueTemplatesController < ApplicationController
  before_filter :find_project_by_project_id
  before_filter :authorize

  helper :sort
  include SortHelper

  def index
    @project_issue_templates = @project.issue_templates.by_position
  end

  def new
    @project_issue_template = @project.issue_templates.build
  end

  def create
    @project_issue_template = @project.issue_templates.build(params[:project_issue_template])

    if @project_issue_template.save
      redirect_to issue_templates_tab_url
    else
      render :action => 'new'
    end
  end

  def edit
    @project_issue_template = @project.issue_templates.find(params[:id])
  end

  def update
    @project_issue_template = @project.issue_templates.find(params[:id])
    if @project_issue_template.update_attributes(params[:project_issue_template])
      redirect_to issue_templates_tab_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project_issue_template = @project.issue_templates.find(params[:id])
    @project_issue_template.destroy
    redirect_to issue_templates_tab_url
  end

  private

  def issue_templates_tab_url
    settings_project_url(:id => @project.id, :tab => :issue_templates)
  end
end

