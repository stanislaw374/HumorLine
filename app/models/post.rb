class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image
                    #:url => "/assets/posts/:id/:style/:basename.:extension",
                    #:path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
  has_attached_file :video
  
  def image_url
    image.url
  end
  
  def video_url
    video.url
  end
end
