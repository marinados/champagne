class Contact < MailForm::Base
  attribute :subject,   validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "Message du site: #{subject}",
      to: "marina.starkova@gmail.com",
      from: %("#{email}>)
    }
  end
end