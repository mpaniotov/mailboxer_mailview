# app/mailers/notifier.rb
class Notifier < ActionMailer::Base

  def invitation
    user = User.first
    UserMailer.invitation(user)
  end

  def welcome(user)
    #user = User.create!
    #mail = Notifier.welcome(user)
    #user.destroy
    #mail
  end

  def forgot_password
    user = Struct.new(:email, :name).new('name@example.com', 'Jill Smith')
    mail = UserMailer.forgot_password(user)
  end

end

# make sure we only load the preview class in development mode
if Rails.env.development?
  class Notifier::Preview < MailView
    # define a method that will be listed as the "view name" in the browser
    # I just used the same name as the email action from the mailer class
    def welcome
      # you will need to generate any objects that the mail action from your
      # mailer class is expecting.
      user = User.first
      Notifier.welcome(user)
    end
  end
end