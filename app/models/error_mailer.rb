class ErrorMailer < ActionMailer::Base
  
  def snapshot(exception, trace, session, params, request, user)
    setup_error_email(exception, trace, session, params, request, user)
    @subject += "A #{RAILS_ENV} exception (#{exception}) has occured"
  end
  
  protected
    def setup_error_email(exception, trace, session, params, request, user)
      @recipients  = "hayesgm@gmail.com,robert@useflyer.com,matt@useflyer.com" #for now, just send direct to me and rob
      @from        = MAILER_FROM
      headers         "Reply-to" => MAILER_FROM
      @subject     = "[Panther] "
      @sent_on     = Time.now
      @body[:exception] = exception
      @body[:trace] = trace
      @body[:session] = session
      @body[:params] = params
      @body[:request] = request
      @body[:user] = user
    end
end
