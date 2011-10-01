class HomeController < ApplicationController
  def index
    flash[:notice] = I18n.t(:Welcome,:to,:CRH)
  end
end
