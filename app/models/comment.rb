class Comment < ApplicationRecord
  belongs_to :task

  validates :text, presence: true
  validates :text, length: { in: 10..256 }
end
