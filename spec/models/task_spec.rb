require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:task) { FactoryBot.create(:task, project_id: project.id) }

  it { is_expected.to have_many(:comments) }
  it { is_expected.to belong_to(:project) }

  it { expect(subject).to validate_presence_of :name }
end
