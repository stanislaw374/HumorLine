class Comment < ActiveRecord::Base
  belongs_to :post
  validates :text, :presence => true
end
