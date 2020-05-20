ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors) # causes out of order output.

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def login(name = "Grace Hopper")
     #Arrange
     #takes a user name in the form of a hash
     user_hash = {
      user: {
        name: name
      }
    }
   # make post request with the hash
    post login_path, params: user_hash

    # find the user and return it
    user = User.find_by(name:name)
    return user
  end
 # add more helper methods here...


end
