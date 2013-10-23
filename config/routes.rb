RedmineApp::Application.routes.draw do
  resources :global_issue_templates,
            :only => [:index, :new, :create, :edit, :update, :destroy]

  resources :projects do
    resources :issue_templates, :controller => 'project_issue_templates',
              :only => [:new, :create, :edit, :update, :destroy]
  end
end

