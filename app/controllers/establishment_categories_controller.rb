class EstablishmentCategoriesController < ApplicationController
    before_action :require_admin
    before_action :set_establishment_category, only: [:update, :destroy]

    def index
        render json: EstablishmentCategory.all, status: :ok
    end

    def create
        @establishment_category = EstablishmentCategory.create(establishment_category_params)
        render json: @establishment_category, status: :created
    end

    def update
        @establishment_category.update(establishment_category_params)
        render json: @establishment_category, status: :ok
    end

    def destroy
        @establishment_category.destroy
        render json: { message: "Establishment category deleted successfully" }, status: :ok
    end

    private
    def set_establishment_category
        @establishment_category = EstablishmentCategory.find(params[:id])
    end

    def establishment_category_params
        params.require(:establishment_category).permit(:name)
    end
end
