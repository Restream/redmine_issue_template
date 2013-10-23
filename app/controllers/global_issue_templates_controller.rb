class GlobalIssueTemplatesController < ApplicationController
  layout 'admin'

  before_filter :require_admin

  helper :sort
  include SortHelper

  def index
    @global_issue_templates = GlobalIssueTemplate.by_position
  end

  def new
    @global_issue_template = GlobalIssueTemplate.new
    render :action => :edit
  end

  def create
    @global_issue_template = GlobalIssueTemplate.new(params[:global_issue_template])

    if @global_issue_template.save
      redirect_to global_issue_templates_url
    else
      render :action => 'edit'
    end
  end

  def edit
    @global_issue_template = GlobalIssueTemplate.find(params[:id])
  end

  def update
    @global_issue_template = GlobalIssueTemplate.find(params[:id])
    if @global_issue_template.update_attributes(params[:global_issue_template])
      redirect_to global_issue_templates_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @global_issue_template = GlobalIssueTemplate.find(params[:id])
    @global_issue_template.destroy
    redirect_to global_issue_templates_url
  end

end

