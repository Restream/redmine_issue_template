# Load the normal Rails helper
require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')

Engines::Testing.setup_plugin_fixtures

if RUBY_VERSION.to_f >= 1.9
  module Engines::Testing
    self.temporary_fixtures_directory = [*FileUtils.mkdir_p(File.join(Dir.tmpdir, "rails_fixtures"))].first
  end
end

# Ensure that we are using the temporary fixture path
Engines::Testing.set_fixture_path
