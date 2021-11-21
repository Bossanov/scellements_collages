class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:construction, :contact]

  def home
  end

  def client
  end

  def admin
  end

  def resultsearch
  end

  def construction
  end

  def contact
  end

  def actualite
  end

  def abonnement
  end

end
