class Project < ApplicationRecord
  belongs_to :user
  has_many :taks, ->{ order(position: :asc) }, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user }
end
