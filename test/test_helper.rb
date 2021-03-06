ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include ApplicationHelper
  # Add more helper methods to be used by all tests here...
  # Returns true if a test user is logged in.
 
  # Возвращает true, если тестовый пользователь вошел.
  def is_logged_in?
    !session[:user_id].nil?
  end


  # Log in as a particular user.
  def log_in_as(user)
	 session[:user_id] = user.id
  end
end


class ActionDispatch::IntegrationTest  #для интеграционых тестов


  def log_in_as(user, password: 'password')

    #password = User.digest(user.password)
    post login_path, params:{ session: { email: user.email,
                                         password: password } }
  end 

  
end
