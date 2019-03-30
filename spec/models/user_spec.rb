require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:projects).dependent(:destroy) }

  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to validate_uniqueness_of :username }
  it { expect(subject).to validate_confirmation_of :password }
  it { expect(subject).to validate_presence_of(:password_confirmation) }
  it { expect(subject).to validate_length_of(:password).is_equal_to(User::PASSWORD_LENGTH) }

  it { expect(subject).to allow_value("#{FFaker::Name.first_name} #{FFaker::Name.last_name}").for(:username) }
  it { expect(subject).not_to allow_value('a' * (User::USERNAME_MIN_LENGTH - 1)).for(:username) }
  it { expect(subject).not_to allow_value('a' * (User::USERNAME_MAX_LENGTH + 1)).for(:username) }
  it { expect(subject).not_to allow_value('').for(:username) }
  it { expect(subject).not_to allow_value('a' * (User::PASSWORD_LENGTH - 1)).for(:password) }
  it { expect(subject).not_to allow_value('a' * (User::PASSWORD_LENGTH + 1)).for(:password) }
  it { expect(subject).not_to allow_value('').for(:password) }

  it 'do not allow special characters for password' do
    "( )!#$%&'*;<+,-.>?@/:=[\]{|}^_`~\"".split.each do |char|
      expect(subject).not_to allow_value("password#{char}").for(:password)
    end
  end
end
