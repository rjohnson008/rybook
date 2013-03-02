require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
	test "that /login route opens the login page" do 
		get '/login'
		assert_response :success
	end

	test "that /logout route opens the logout page" do 
		get '/logout'
		# Need to include :redirect because logout destroys the user session then redirects to the root_path ('/').
		assert_response :redirect
		assert_redirected_to '/' 	# '/' represents the root_path
	end

	test "that /register route opens the register page" do 
		get '/register'
		assert_response :success
	end
end
