class Mark < ActiveRecord::Base
validates :value, presence:true
validates :value, :inclusion => 2..5
belongs_to :subject
belongs_to :user
end