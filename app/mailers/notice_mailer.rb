class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_post(post)
    @post = post

    mail to: "age.shibata@gmail.com",
         subject: '【EXAM2】新たに投稿がされました'
  end
end
