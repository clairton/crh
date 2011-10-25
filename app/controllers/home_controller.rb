class HomeController < ApplicationController
  def index
    flash[:notice] = "#{I18n.t :welcome} #{I18n.t :to} #{I18n.t :CRH}"
  end
end
