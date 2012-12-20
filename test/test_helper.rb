# Load the normal Rails helper
require File.expand_path(File.dirname(__FILE__) + '/../../../test/test_helper')

ActiveSupport::TestCase.append_fixture_path File.expand_path('../fixtures', __FILE__)
