require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:task) { FactoryBot.create(:task, user_id: user.id, project_id: project.id) }
  let(:comment) { FactoryBot.create(:comment) }

  it { expect(subject).to belong_to(:task) }
  it { expect(subject).to validate_presence_of :text }
end
