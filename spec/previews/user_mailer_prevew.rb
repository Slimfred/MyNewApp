class UserMailerPreview < ActionMailer::Preview

  def contact_form
    UserMailer.contact_form("fred@example.com", "Fred", "Hello World!")
  end

end
