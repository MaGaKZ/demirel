class Subject < ActiveRecord::Base
  validates :user_id, presence: true
  has_many :marks
  belongs_to :group
end
