class Comment < ApplicationRecord
  belongs_to :task

  mount_uploader :file, ImageUploader

  validates :text, presence: true
  validates :text, length: { in: 10..256 }
  validates_size_of :file, maximum: 10.megabytes, message: I18n.t('models.comment.file')
end
