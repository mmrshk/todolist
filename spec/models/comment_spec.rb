require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:task) }
  it { expect(subject).to validate_presence_of :text }
end
