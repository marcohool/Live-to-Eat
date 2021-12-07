class ApplicationMailer < ActionMailer::Base
  default to: "info@livetoeat.com", from: "info@livetoeat.com"
  layout 'mailer'
end
