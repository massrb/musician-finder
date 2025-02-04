
require 'rails_helper'

RSpec.describe Profile, :type => :model do

  it "is valid with valid attributes" do
    expect(Profile.new).to be_valid
  end

  it { should have_many(:mailings) }
  it { should have_many(:emails).through(:mailings) }

 it "should be ok with an associated mailing" do
    @profile = Profile.new
    email = Email.new
    email.save!
    mailing = Mailing.new(email: email, profile: @profile)
    mailing.save!
    expect(mailing).to be_valid
    expect(@profile.mailings.count).to eq(1)
    expect(email.profiles.count).to eq(1)
    expect(email.profiles.first).to eq(@profile)
  end

end