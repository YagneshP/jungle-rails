require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'should create user with same password and password_confirmation' do
      @user = User.new(:name => 'User1', :email => 'user1@test.com', :password => 'password', :password_confirmation => 'password')
      @user.save
      expect(@user).to be_valid
      expect(User.all.count).to eq(1)
      # can i redirect to the home page
    end
    it 'should not create user with different password and password_confirmation' do
      @user = User.new(:name => 'User1', :email => 'user1@test.com', :password => 'password', :password_confirmation => '12345678')
      @user.save
      expect(@user).not_to be_valid
      expect(User.all.count).to eq(0)
      # can i redirect to the home page
    end
    it 'should not create user with password is nil' do
      @user = User.new(:name => 'User1', :email => 'user1@test.com', :password => nil, :password_confirmation => 'password')
      @user.save
      expect(User.all.count).to eq(0)
      expect(@user.errors.full_messages).not_to be_empty
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end
    it 'should not create user with password_confirmation is nil' do
      @user = User.new(:name => 'User1', :email => 'user1@test.com', :password => 'password', :password_confirmation => nil)
      @user.save
      expect(User.all.count).to eq(0)
      expect(@user.errors.full_messages).not_to be_empty
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank") 
    end
    it 'should not create user with same Email(case senitive)' do
      @user1 = User.new(:name => 'User1', :email => 'test@test.COM', :password => 'password', :password_confirmation => 'password')
      @user1.save
      @user2 = User.new(:name => 'User2', :email => 'TEST@TEST.com', :password => 'password1', :password_confirmation => 'password1')
      @user2.save
      expect(User.all.count).to eq(1)
      expect(@user2.id).to be_nil
      expect(@user2.errors.full_messages).to include("Email has already been taken") 
    end
    it 'should not create user with Email is nil' do
      @user = User.new(:name => 'User1', :email => nil, :password => 'password', :password_confirmation => 'password')
      @user.save
      expect(User.all.count).to eq(0)
      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).not_to be_empty
      expect(@user.errors.full_messages).to include("Email can't be blank") 
    end
    it 'should not create user with name is nil' do
      @user = User.new(:name => nil, :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
      @user.save
      expect(User.all.count).to eq(0)
      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).not_to be_empty
      expect(@user.errors.full_messages).to include("Name can't be blank") 
    end
    it 'should not create user without minimum length password' do
      @user = User.new(:name => 'user', :email => 'test@test.com', :password => 'pass', :password_confirmation => 'pass')
      @user.save
      expect(User.all.count).to eq(0)
      expect(@user.id).to be_nil
      expect(@user.errors.full_messages).not_to be_empty
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should find a user with authentic credentials' do
      @user = User.new(:name => 'user', :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
      @user.save
      @founduser = User.authenticate_with_credentials('test@test.com', 'password')
      expect(@founduser).not_to be_nil
      expect(@founduser.id).not_to be_nil
      expect(@founduser.id).to eq(@user.id)
    end
    it 'should not find a user with wrong password' do
      @user = User.new(:name => 'user', :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
      @user.save
      @founduser = User.authenticate_with_credentials('test@test.com', 'password12')
      expect(@founduser).to be_nil
    end
    it 'should not find a user with wrong email address' do
      @user = User.new(:name => 'user', :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
      @user.save
      @founduser = User.authenticate_with_credentials('test@test1.com', 'password')
      expect(@founduser).to be_nil
    end

    # edge cases

    it 'should find a user with email with spaces around it' do
      @user = User.new(:name => 'user', :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
      @user.save
      @founduser = User.authenticate_with_credentials(' test@test.com ', 'password')
      expect(@founduser).not_to be_nil
      expect(@founduser.id).to eq(@user.id)
    end

    it 'should find a user with email with uppercase too' do
      @user = User.new(:name => 'user', :email => 'EXAMPLe123@DOMAIN.CoM', :password => 'password', :password_confirmation => 'password')
      @user.save
      
      @founduser = User.authenticate_with_credentials('eXample123@domain.COM', 'password')

      expect(@founduser).not_to be(nil)
      expect(@founduser.id).to eq(@user.id)
    end
  end

end
