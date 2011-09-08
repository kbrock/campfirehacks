class ScriptsController < ApplicationController

  def show
    params[:id] =~ /([0-9]+)\.user/
    @id = $1 || params[:id]

    @me = Avatar.find_by_username(@id) rescue nil
  end

  def show2
    params[:id] =~ /([0-9]+)\.user/
    @id = $1 || params[:id]

    #TODO: only pull back those that I want to ignore
    @components=Component.all

    @avatars = Avatar.all

    @me = Avatar.find_by_username(@id) rescue nil
  end
end