class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user, message: I18n.t('controllers.project.name_exist') }
end
