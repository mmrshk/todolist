class Comment < ApplicationRecord
  belongs_to :task

  mount_uploader :file, ImageUploader

  TEXT_LENGTH_RANGE = (10..256).freeze
  FILE_SIZE = 10.megabytes

  validates :text, presence: true
  validates :text, length: { in: TEXT_LENGTH_RANGE }
  validates_size_of :file, maximum: FILE_SIZE, message: I18n.t('models.comment.file')
end
