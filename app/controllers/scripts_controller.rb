class ScriptsController < ApplicationController

  def show
    params[:id] =~ /([0-9]+)\.user/
    @id = $1 || params[:id]

    #TODO: only pull back those that I want to ignore
    #@components=Component.all

    @me = Avatar.find_by_username(@id) rescue nil
  end
end