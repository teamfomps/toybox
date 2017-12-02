class ApplicationMailer < ActionMailer::Base
  default from: 'webmaster@teamfomps.com',
          to: ['jackpearsonmusic@gmail.com', 'pearson@peterpearson.com', 'stephen@vandahm.com']
  layout 'mailer'
end
