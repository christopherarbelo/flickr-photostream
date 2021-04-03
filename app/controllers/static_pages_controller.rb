require 'flickr'

class StaticPagesController < ApplicationController
  def photostream
    @photos = flickr_photos if flickr_id
  end
  
  private
  def flickr_photos
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
    begin
      flickr.people.getPublicPhotos(user_id: @flickr_id)
    rescue => error
      flash.now[:error] = 'User not found'
      render :photostream
    end
  end

  def flickr_id
    @flickr_id ||= params['flickr_id']
  end
end
