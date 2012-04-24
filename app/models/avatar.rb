require 'net/http'
require 'uri'


class Avatar < ActiveRecord::Base
  validates :campfire, :presence => true
  def update_image
    update_attributes(:image_url => Avatar.twitter_image(self.username))
  end

  def self.quick(twitter, campfire, image_url=nil, options={})
    if unique && (avatar = Avatar.find_by_username(twitter))
      puts "existing with campfire #{avatar}"
      avatar
    else
      timage_url ||= twitter_image(twitter)
      Avatar.create(options.merge(:campfire => campfire, :username => twitter, :image_url => image_url))
    end
  end

  def self.update_image(twitter)
    find_by_username(twitter).update_image
  end

  def self.twitter_image(twitter)
    redirection_url "http://api.twitter.com/1/users/profile_image?screen_name=#{twitter}&size=normal"
  end

  private

  #thanks http://stackoverflow.com/questions/5872210/get-redirect-of-a-url-in-ruby
  #TODO: try head
  def self.redirection_url(url)
    Net::HTTP.get_response(URI.parse(url))['location']
  end
end

