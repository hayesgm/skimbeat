# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'skimbeat'
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  
  
  ####################
  #   Error logging  #
  ####################

  #TODO: We should make sure this gets logged somewhere
  #TODO: Add database error logging
  #TODO: Be careful we don't make any new errors in this
  def log_error(exception) 
    super(exception)
    
    begin
      if !exception.instance_of?(ActionController::RoutingError) && !local_request? && !(request.remote_ip =~ /^192[.]168[.].+/)#we're going to skip these for now
        ErrorMailer.deliver_snapshot(
          exception,
          exception.backtrace.nil? ? '' : clean_backtrace(exception).join("<br/>&nbsp;&nbsp;"), 
          session.inspect, 
          params.inspect, 
          request.env.inspect,
          signed_in? ? current_user : nil)
      end
    rescue => e
      logger.error("Failure to send error e-mail.");
      logger.error(e)
    end
  end
end
