class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def client
  end

  def admin
  end

  def resultsearch
  end

end
