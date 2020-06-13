require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password_digest: 'test')
    assert user.valid?
  end
  test 'user with an invalid email should not be valid' do
    user = User.new(email: 'test.test.org', password_digest: 'test2')
    assert_not user.valid?
  end
  test 'user with already taken email should not be valid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test3')
    assert_not user.valid?
  end
end