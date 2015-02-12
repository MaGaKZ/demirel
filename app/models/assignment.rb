class Assignment < ActiveRecord::Base
  belongs_to :subject
  has_many :comments
  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type =>['application/pdf']
end
