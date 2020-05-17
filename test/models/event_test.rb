require 'test_helper'
class EventTest < ActiveSupport::TestCase
  test '#created_by? owner_id と 引数の#id が同じとき' do
    event = FactoryBot.create(:event)
    assert_equal(true, event.created_by?(event.owner))
  end
  test '#created_by? owner_id と 引数の#id が異なるとき' do
    event = FactoryBot.create(:event)
    another_user = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(another_user))
  end
  test '#created_by? 引数が nil なとき' do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end

  # stub
  # test '#created_by? owner_id と 引数の#id が同じとき(stub)' do
  #   event = FactoryBot.create(:event)
  #   user = User.new #((1))
  #   user.stub(:id, event.owner_id) do #((2))
  #     assert_equal(true, event.created_by?(user)) #((3))
  #   end
  # end
  # test '#created_by? owner_id と 引数の#id が異なるとき(stub)' do
  #   event = FactoryBot.create(:event)
  #   user = User.new
  #   another_user = FactoryBot.create(:user)
  #   user.stub(:id, event.owner_id) do
  #     assert_equal(false, event.created_by?(another_user))
  #   end
  # end

  # mock
  # test '#created_by? owner_id と 引数の#id が同じとき(mock)' do
  #   event = FactoryBot.create(:event)
  #   user = MiniTest::Mock.new.expect(:id, event.owner_id) #((1))
  #   assert_equal(true, event.created_by?(user))
  #   user.verify #((2))
  # end
  # test '#created_by? owner_id と 引数の#id が異なるとき(mock)' do
  #   event = FactoryBot.create(:event)
  #   user = MiniTest::Mock.new.expect(:id, -1)
  #   assert_equal(false, event.created_by?(user))
  #   user.verify
  # end

  # validation test
  test 'start_at_should_be_before_end_at validation OK' do
    start_at = rand(1..30).days.from_now #((1))
    end_at = start_at + rand(1..30).hours #((2))
    event = FactoryBot.build(:event,
                             start_at: start_at, end_at: end_at) #((3))
    event.valid? #((4))
    assert_empty(event.errors[:start_at]) #((5))
  end

  test 'start_at_should_be_before_end_at validation error' do
    start_at = rand(1..30).days.from_now
    end_at = start_at - rand(1..30).hours
    event = FactoryBot.build(:event,
                             start_at: start_at, end_at: end_at)
    event.valid?
    assert_not_empty(event.errors[:start_at]) #((1))
  end
end
