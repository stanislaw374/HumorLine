# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all

#1.times do 
#  Post.create(post_type: 'image', title: 'Image_post', image_url: "http://pics.livejournal.com/che_ratnik/pic/0004adqe", lat: Random.rand(-100...100), lng: Random.rand(-100...100), likes: 0)
#  Post.create(post_type: 'video', title: "Video_post", video_url: "http://www.samkeeneinteractivedesign.com/videos/littleVid3.mp4", lat: Random.rand(-100...100), lng: Random.rand(-100...100), likes: 0)
#end