# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  #internacionalização
  before_filter :localizate,:authenticate_user!#,:except => [:show, :index]
  
  #método responável pela internacionalização
  def localizate
    I18n.locale = params[:locale] || 'pt-BR'
  end
end
