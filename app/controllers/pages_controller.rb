class PagesController < ApplicationController
  def home
    redirect_to notes_url
  end
end
