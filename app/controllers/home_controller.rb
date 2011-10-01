class HomeController < ApplicationController
  def index
    flash[:notice] = "#{I18n.t :Welcome} #{I18n.t :to} #{I18n.t :CRH}"
  end
end
