class NotificationMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def auction_published(user, auction)
    @auction = auction
    mail(to: user.email, subject: 'New auction is available')
  end
end
