class StaticPagesController < ApplicationController

  def search
    @results = PgSearch
      .multisearch(params[:query])
      .includes(:searchable)
      .page(params[:page])
  end

end
