class ApplicationMailer < ActionMailer::Base
  default from: 'website@jackpearson.org',
          to: ['jackpearsonmusic@gmail.com', 'peter@peterpearson.com', 'stephen@vandahm.com']
  layout 'mailer'
end
