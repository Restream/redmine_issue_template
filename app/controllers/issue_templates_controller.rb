class IssueTemplatesController < ApplicationController
  unloadable
  
  layout 'admin'

  before_filter :require_admin
  before_filter :find_issue_template, :except => [:index, :new, :create]

  def index
    @issue_templates = IssueTemplate.order("created_at DESC")
  end

  def new
    @issue_template = IssueTemplate.new
    render :action => :edit
  end

  def create
    @issue_template = IssueTemplate.new(params[:issue_template])

    if @issue_template.save
      redirect_to issue_templates_url
    else
      render :action => "edit"
    end
  end

  def edit
  end

  def update
    if @issue_template.update_attributes(params[:issue_template])
      redirect_to issue_templates_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @issue_template.destroy
    redirect_to issue_templates_url
  end

private

  def find_issue_template
    @issue_template = IssueTemplate.find(params[:id])
  end
end

