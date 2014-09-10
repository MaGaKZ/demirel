class Group < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :subjects, dependent: :destroy
end
