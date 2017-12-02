class ApplicationMailer < ActionMailer::Base
  default from: 'webmaster@teamfomps.com',
          to: ['jackpearsonmusic@gmail.com', 'peter@peterpearson.com', 'stephen@vandahm.com']
  layout 'mailer'
end
