class SearchesController < ApplicationController
  def show
    @search = find_search(params[:id])
    @places = apply_scopes(@search.results).ordered_by_update.page(params[:page])
    @paginate_params = paginate_params
  end

  private

  def find_search(slug)
    Search.friendly.find(slug)
  end

  def paginate_params
    params.permit(:page)
  end
end
