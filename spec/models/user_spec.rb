require 'rails_helper'

describe User do

    before(:each) do
      @info = {
        :username => "Normal User",
        :email => "user@email.com",
        :password => "changeme",
        :password_confirmation => "changeme"
      }
    end
  
    it "should create a new instance given a valid information" do
      User.create!(@info)
    end
  
    it "should require an email address" do
      user_email = User.new(@info.merge(:email => ""))
      user_email.should_not be_valid
    end
  
    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@info.merge(:email => address))
        valid_email_user.should be_valid
      end
    end
  
 
  
    it "should reject duplicate email addresses" do
      User.create!(@info)
      user_with_duplicate_email = User.new(@info)
      user_with_duplicate_email.should_not be_valid
    end
  
    it "should reject email addresses identical up to case" do
      upcased_email = @info[:email].upcase
      User.create!(@info.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@info)
      user_with_duplicate_email.should_not be_valid
    end
  
    describe "passwords" do
  
      before(:each) do
        @user = User.new(@info)
      end
  
      it "should have a password infoibute" do
        @user.should respond_to(:password)
      end
  
      it "should have a password confirmation infoibute" do
        @user.should respond_to(:password_confirmation)
      end
    end
  
    describe "password validations" do
  
      it "should require a password" do
        User.new(@info.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
      end
  
      it "should require a matching password confirmation" do
        User.new(@info.merge(:password_confirmation => "invalid")).
          should_not be_valid
      end
  
      it "should reject short passwords" do
        short = "a" * 5
        hash = @info.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end
  
    end
  
    describe "password encryption" do
  
      before(:each) do
        @user = User.create!(@info)
      end
  
      it "should have an encrypted password infoibute" do
        @user.should respond_to(:encrypted_password)
      end
  
      it "should set the encrypted password infoibute" do
        @user.encrypted_password.should_not be_blank
      end
  
    end
  
  end