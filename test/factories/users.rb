FactoryBot.define do
  factory :user, aliases: [:owner] do #((1))
    provider { "github" } #((2))
    sequence(:uid) { |i| "uid#{i}" } #((3))
    sequence(:name) { |i| "name#{i}" }
    sequence(:image_url) { |i| "http://example.com/image#{i}.jpg"}
  end
end
