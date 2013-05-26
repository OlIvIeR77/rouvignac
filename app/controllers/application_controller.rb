class ApplicationController < ActionController::Base
	include Mercury::Authentication
    protect_from_forgery
end
