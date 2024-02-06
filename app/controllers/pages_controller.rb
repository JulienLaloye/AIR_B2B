class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @djs = Dj.all
  end
end
