Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "ce7902651e6ec2af656e", "d5932e34bf7b936c63660253cbdf2851ab8217b8" # ((1))
  else
    provider :github, # ((2))
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end
