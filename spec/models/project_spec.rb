require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }

  it { expect(subject).to validate_presence_of :name }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tasks) }
end
