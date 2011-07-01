class SheetsController < ApplicationController

  def show
    #TODO: only pull back those that I want to ignore
    @components=Component.all

    @avatars = Avatar.all
    @me = Avatar.find_by_username(params[:id]) rescue nil

  end
end