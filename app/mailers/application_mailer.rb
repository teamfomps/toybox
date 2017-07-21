class ApplicationMailer < ActionMailer::Base
  default from: 'webmaster@teamfomps.com',
          to: ['jackpearsonmusic@gmail.com', 'pearson@sdf.lonestar.org']
  layout 'mailer'
end
