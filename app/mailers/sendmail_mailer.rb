class SendmailMailer < ApplicationMailer
    def email_send title, content, email
    mail from: 'kbs4674@gmail.com',
        to: email,
        subject: title,
        body: content
    end
end