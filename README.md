# Redmine Issue Template

[![Build Status](https://travis-ci.org/Undev/redmine_issue_template.png?branch=master)](https://travis-ci.org/Undev/redmine_issue_template)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_issue_template.png)](https://codeclimate.com/github/Undev/redmine_issue_template)

This plugin adds the project issue template module to Redmine and makes it possible to create issue templates and use them in issue descriptions.

## Installation

*These installation instructions are based on Redmine 2.x. For instructions for Redmine 1.x, see [Redmine wiki](http://www.redmine.org/projects/redmine/wiki/Plugins).*

1. To install the plugin
    * Download the .ZIP archive, extract files and copy the plugin directory into #{REDMINE_ROOT}/plugins.
    
    Or

    * Change you current directory to your Redmine root directory:  

            cd {REDMINE_ROOT}
 
      Copy the plugin from GitHub using the following command:

            git clone https://github.com/Undev/redmine_issue_template.git plugins/redmine_issue_template

2. This plugin requires a migration. Run the following command to upgrade your database (make a database backup before):  

        rake redmine:plugins:migrate RAILS_ENV=production

3. Restart Redmine.

Now you should be able to see the plugin in **Administration > Plugins**.

## Usage

1. Enable the project issue template module on the project **Settings** tab.  
  ![issue template module](issue_template_1.PNG)  
  This will add a new **Issue templates** tab to the project settings.
2. Switch to the **Issue templates** tab and create the required issue templates.
![create issue template](issue_template_2.PNG) 
3. When creating a new issue, select the required issue template and click **Insert template**.
![select issue template](issue_template_3.PNG) 
4. This will add the template's text to the issue description field at the cursor position.
![add issue template](issue_template_4.PNG) 
5. To edit or delete the issue template, go to the **Issue templates** tab of the project settings.
![edit issue template](issue_template_5.PNG) 

## License
Copyright 2014, NPTV

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
