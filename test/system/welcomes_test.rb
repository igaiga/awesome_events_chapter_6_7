require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  test "/ ページを表示" do
    visit root_url

    assert_selector "h1", text: "イベント一覧"
  end

  test "/ ページを表示して、未来のイベントが表示され、過去のイベントが表示されないこと" do
    future_event = FactoryBot.create(:event, start_at: Time.zone.now + 1.day)
    past_event = FactoryBot.create(:event, start_at: Time.zone.now - 1.day)

    visit root_url
    assert_selector "h5", text: future_event.name
    assert_no_selector "h5", text: past_event.name
  end
end
