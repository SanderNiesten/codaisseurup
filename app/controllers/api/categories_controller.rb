class Api::CategoriesController < Api::BaseController

  def index
    render status: 200, json: {
      categories: Category.all
    }.to_json
  end
end
