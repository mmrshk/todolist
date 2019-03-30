require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to have_many(:comments) }
  it { is_expected.to belong_to(:project) }

  it { expect(subject).to validate_presence_of :name }
end
