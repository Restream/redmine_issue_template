require File.dirname(__FILE__) + '/../test_helper'

class ProjectIssueTemplatesControllerTest < ActionController::TestCase
  fixtures :projects,
    :users,
    :roles,
    :members,
    :member_roles,
    :issues,
    :issue_statuses,
    :versions,
    :trackers,
    :projects_trackers,
    :issue_categories,
    :enabled_modules,
    :enumerations

  def setup
    @project = Project.find(3)
    @project.enable_module! :project_issue_templates
    @project.save!

    # jsmith
    user         = User.find(2)
    User.current = user

    @controller                = ProjectIssueTemplatesController.new
    @request                   = ActionController::TestRequest.new
    @response                  = ActionController::TestResponse.new
    @request.session[:user_id] = 1 # admin

    @some_template = @project.issue_templates.create!(
      title:   'Title',
      content: 'Content'
    )

    @new_template = {
      title:   'new title',
      content: 'new content'
    }
  end

  def test_permission
    @request.session[:user_id] = 4
    get :new, project_id: @project.id
    assert_response 403

    Role.find(4).add_permission! :manage_project_issue_templates

    get :new, project_id: @project.id
    assert_response :success
  end

  def test_should_get_new
    get :new, project_id: @project.id
    assert_response :success
  end

  def test_should_post_create
    post :create, project_id: @project.id, project_issue_template: @new_template
    assert @project.issue_templates.find_by_title(@new_template[:title])
    assert_response :redirect
  end

  def test_should_get_edit
    get :edit, project_id: @project.id, id: @some_template.id
    assert_response :success
  end

  def test_should_put_update
    put :update, project_id:  @project.id, id: @some_template.id,
      project_issue_template: @new_template
    @some_template.reload
    assert_equal @some_template.title, @new_template[:title]
    assert_response :redirect
  end

  def test_should_delete_destroy
    delete :destroy, project_id: @project.id, id: @some_template.id
    assert_response :redirect
    assert_nil @project.issue_templates.find_by_title(@some_template.title)
  end
end
