class ApplicationController < ActionController::Base
	include SessionsHelper
	include Pagy::Backend
	def hello
		render html: "hello, world!"
	end
	private
        #  Xác nhận người dùng đã đăng nhập.
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end
end
