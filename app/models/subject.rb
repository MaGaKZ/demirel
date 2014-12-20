class Subject < ActiveRecord::Base
  validates :user_id, presence: true
  has_many :marks
  has_many :assignments
  belongs_to :group
  has_many :users, through: :group
end
