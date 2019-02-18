require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it { should have_many(:projects).dependent(:destroy) }

  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to validate_uniqueness_of :username }
  it { expect(subject).to validate_confirmation_of :password }
  it { expect(subject).to validate_presence_of(:password_confirmation) }
  it { expect(subject).to validate_length_of(:password).is_equal_to(8) }

  it { expect(subject).to allow_value('Dima Bavykin').for(:username) }
  it { expect(subject).not_to allow_value('a').for(:username) }
  it { expect(subject).not_to allow_value('a' * 51).for(:username) }

  it 'do not allow special characters for password' do
    "( )!#$%&'*;<+,-.>?@/:=[\]{|}^_`~\"".split.each do |char|
      expect(subject).not_to allow_value("password#{char}").for(:password)
    end
  end
end
