require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "validates password & password_confirmation" do
      user = User.new(
        first_name: "first",
        last_name: 'last',
        email: 'email',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save!

      expect(user.password).to eq(user.password_confirmation)
    end

    it "password & password_confirmation must match" do
      user = User.new(
        first_name: "first",
        last_name: 'last',
        email: 'email',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save!

      expect(user.password).not_to be_empty
      expect(user.password_confirmation).not_to be_empty
    end

    
  end
end
