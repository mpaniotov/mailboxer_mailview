# app/mailers/mail_preview.rb or lib/mail_preview.rb
class MailPreview < MailView
  # Pull data from existing fixtures
  def invitation
    account = Account.first
    inviter, invitee = account.users[0, 2]
    Notifier.invitation(inviter, invitee)
  end

  # Factory-like pattern

  def welcome
    @i=0
    user = User.create!(:email=>"quu@q.com",:password=>'12345678')
    #mail = Notifier.welcome(user)
    user.destroy
    mail
  end

  # Stub-like
  def forgot_password
    user = Struct.new(:email, :name).new('name@example.com', 'Jill Smith')
    mail = User.forgot_password(user)
  end
end