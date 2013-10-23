require File.dirname(__FILE__) + '/../test_helper'

class GlobalIssueTemplatesControllerTest < ActionController::TestCase
  fixtures :users

  def setup
    # admin
    user = User.find(1)
    User.current = user
    session[:user_id] = user.id

    @some_template = GlobalIssueTemplate.create!(
        :title => 'Title',
        :content => 'Content'
    )

    @new_template = {
      :title => 'new title',
      :content => 'new content'
    }
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_post_create
    post :create, :global_issue_template => @new_template
    assert GlobalIssueTemplate.find_by_title(@new_template[:title])
    assert_response :redirect
  end

  def test_should_get_index
    get :index
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => @some_template.id
    assert_response :success
  end

  def test_should_put_update
    put :update, :id => @some_template.id, :global_issue_template => @new_template
    @some_template.reload
    assert_equal @some_template.title, @new_template[:title]
    assert_response :redirect
  end

  def test_should_delete_destroy
    delete :destroy, :id => @some_template.id
    assert_response :redirect
    assert_nil GlobalIssueTemplate.find_by_title(@some_template.title)
  end
end
