#if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => 'onlineauctionutfpr@gmail.com',
    :password             => 'online123',
    :authentication       => "plain",
    :enable_starttls_auto => true,
    :openssl_verify_mode => 'none'
  }
#end