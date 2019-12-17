require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do  
    it 'should create valid user' do
      user = User.create(
        name: nil,
        email: "sushant@gmail.com",
        password: "secret",
        password_confirmation: "secret"
        )
      expect(user).to_not (be_valid)
    end

    it 'should have same password and password confirmation' do
      user = User.create(
        name: "raj",
        email: "raj@gmail.com",
        password: "secret",
        password_confirmation: "secret"
        )
      expect(user.password).to eq(user.password_confirmation)
    end

    it 'should have same password and password confirmation' do
      user = User.create(
        name: "raj",
        email: "raj@gmail.com",
        password: "secret",
        password_confirmation: "tecret"
        )
      expect(user.password).to_not eq(user.password_confirmation)
    end

    it 'should not save without unique email' do
      user1 = User.create(
        name: "Other Name",
        email: "raj5@gmail.com",
        password: "secretj",
        password_confirmation: "secretj"
        )
      user2 = User.create(
        name: "rajjj",
        email: "RAJ5@GMAIL.COM",
        password: "secretj",
        password_confirmation: "secretj"
        )
      expect(user2).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(
        name: "Abhiraj",
        email: "abhiraj@abhiraj.com",
        password: "qw",
        password_confirmation: "qw"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should check the user in database' do
      user = User.create(
      name: "sushantb",
      email: "sushantb@gmail.com",
      password: "qwerty",
      password_confirmation: "qwerty"
      )
    authenticate = user.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to be_truthy
    end
  end
end
