class UserMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  def send_email
    @reminder = params[:reminder]
    user_email = @reminder.user.email

    from = Email.new(email: Rails.application.credentials.dig(:sendgrid, :from_email))
    to = Email.new(email: user_email)
    subject = 'Document Reminder'
    content = Content.new(type: 'text/plain', value: "This is a reminder to: #{@reminder.message} on #{@reminder.send_at}")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: Rails.application.credentials.dig(:sendgrid, :api_key))
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    puts response.status_code
    puts response.body
    puts response.headers
  end
end
