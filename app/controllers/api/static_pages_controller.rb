class Api::StaticPagesController < ApplicationController

  def search
    @results = PgSearch
      .multisearch(params[:query])
      .includes(:searchable)
      .page(params[:page])
      .map(&:searchable)
  end

end