class CountriesController < ApplicationController

  def index
    if params[:query].present?
      @countries = Country.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @countries = Country.all
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { countries: @countries } }
    end
  end
end
