class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.project_created.subject
  #
  def project_created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
