require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "validates password & password_confirmation && matching" do
      user = User.new(
        first_name: "first",
        last_name: 'last',
        email: 'email',
        password: 'password',
        password_confirmation: 'password'
      )
      
      user2 = User.new(
        first_name: "first",
        last_name: 'last',
        email: 'email2',
        password: 'password',
        password_confirmation: ''
      )
      
      expect(user.password).to eq(user.password_confirmation)
      expect(user2).to_not be_valid
    end

    it "validate if email has been used before" do
      user = User.create(
        first_name: "first",
        last_name: 'last',
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      
      user2 = User.create(
        first_name: "first2",
        last_name: 'last2',
        email: 'Email@email.com',
        password: 'password2',
        password_confirmation: 'password2'
      )
      expect(user).to be_valid
      expect(user2).to_not be_valid
    end

    it "validates first_name last_name and email" do
      user = User.create(
        first_name: "",
        last_name: 'last',
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      
      user2 = User.create(
        first_name: "first2",
        last_name: '',
        email: 'myemail@email.com',
        password: 'password2',
        password_confirmation: 'password2'
      )

      user3 = User.create(
        first_name: "first3",
        last_name: 'last3',
        email: nil,
        password: 'password3',
        password_confirmation: 'password3'
      )
      expect(user).to_not be_valid
      expect(user2).to_not be_valid
      expect(user3).to_not be_valid
    end

    it "validate a min length of password" do
      user = User.create(
        first_name: "first",
        last_name: 'last',
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      
      user2 = User.create(
        first_name: "first2",
        last_name: 'last2',
        email: 'myemail@email.com',
        password: 'pa',
        password_confirmation: 'pa'
      )
      expect(user).to be_valid
      expect(user2).to_not be_valid
    end
  end
end
