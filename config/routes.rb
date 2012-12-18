RedmineApp::Application.routes.draw do
  resources :issue_templates,
            :only => [:index, :new, :create, :edit, :update, :destroy]
end

