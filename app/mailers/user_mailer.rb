class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウント登録手続きの案内"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
