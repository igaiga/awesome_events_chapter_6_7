module SignInHelper
  def sign_in_as(user) #((1))
    OmniAuth.config.test_mode = true #((2))
    OmniAuth.config.add_mock( #((3))
      user.provider,
      uid: user.uid,
      info: { nickname: user.name,
              image: user.image_url })

    visit root_url #((4))
    click_on "GitHubでログイン" #((5))
    @current_user = user
  end

  def current_user
    @current_user
  end
end
