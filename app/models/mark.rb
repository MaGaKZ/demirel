class Mark < ActiveRecord::Base
	validates :value, presence:true
  belongs_to :subject
  belongs_to :user
end
