class SearchesController < ApplicationController
  
  def index
    if !user_signed_in? && params[:q].blank?
      #render page aka do nothing
    elsif !user_signed_in? && params[:q]
      #store q && redirect
      session[:q] = params[:q]
      redirect_to facebook_auth
    elsif signed_id? && session[:q].any?
      #  remove q from session and render results
      params[:q] = session[:q].delete
      query_facebook
    else
      #render results
      query_facebook
    end
  end  
    
  private
  
  def query_facebook
    @results = current_user.facebook.search.query(params[:q]).info!
  end
    
end
