class ApplicationController < ActionController::Base


	before_filter :set_locale
	def set_locale
	    I18n.locale = params[:locale] || I18n.default_locale
	end


	include Mercury::Authentication
    protect_from_forgery

    
end
