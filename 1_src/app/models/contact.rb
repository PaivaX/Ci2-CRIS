class Contact < MailForm::Base
    attribute :name,      validate: true
    attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message,   validade: true
  
    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.
    def headers
      {
        :subject => "Contact Form CI2-IPT",
        :to => "rui.paiva88@gmail.com",
        :from => %("#{name}" <#{email}>)
      }
    end
end