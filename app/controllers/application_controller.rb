class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :set_locale

  GREEN = '#7fb30e'
  RED = '#e01312'

	def set_locale
	    I18n.locale = params[:locale] || I18n.default_locale
	end

  #before_filter :ios_support
  #def ios_support
  #  response.set_header("Accept-Ranges", "bytes")
  #end

end
