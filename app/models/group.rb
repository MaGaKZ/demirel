class Group < ActiveRecord::Base
  has_many :users
  has_many :subjects, dependent: :destroy
end
