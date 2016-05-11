class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activations.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Aktivacija računa"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_resets.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Promjena lozinke"
  end

  def lazy_editor(user)
    @user = user
    recipients = []
    admini = User.administratori
    admini.each do |a|
      recipients << a.email
    end
    mail to: recipients, subject: "Lijeni urednik"
  end
end
