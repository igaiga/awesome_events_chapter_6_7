module SignInHelper
  def sign_in_as(user) #((1))
    OmniAuth.config.add_mock( #((2))
      user.provider,
      uid: user.uid,
      info: { nickname: user.name,
              image: user.image_url })

    visit root_url #((3))
    click_on "GitHubでログイン" #((4))
    @current_user = user
  end

  def current_user
    @current_user
  end
end
