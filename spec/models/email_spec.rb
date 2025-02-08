
require 'rails_helper'

RSpec.describe Profile, :type => :model do

  it "is valid with valid attributes" do
    expect(Email.new(subject: 'Re', body: nil)).to_not be_valid
    expect(Email.new(subject: 'Re', body: '')).to_not be_valid
    expect(Email.new(subject: 'Re', body: ' ')).to_not be_valid
    expect(Email.new(subject: 'Re', body: 'please contact me')).to be_valid
  end

end