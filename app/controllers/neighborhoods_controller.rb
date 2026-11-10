class NeighborhoodsController < ApplicationController
    before_action :set_property, only: [:index, :create]
    before_action :set_neighborhood, only: [:update, :destroy]
    before_action :require_admin, only: [:create, :update, :destroy]

    def index
        render json: @property.neighborhoods, status: :ok
    end

    def create
        neighborhood = @property.neighborhoods.create(neighborhood_params)
        render json: neighborhood, status: :created
    end

    def update
        @neighborhood.update(neighborhood_params)
        render json: @neighborhood, status: :ok
    end

    def destroy
        @neighborhood.destroy
        render json: { message: "Neighborhood deleted successfully" }, status: :ok
    end

    private

    def set_property
        @property = Property.find(params[:property_id])
    end

    def set_neighborhood
        set_property()
        @neighborhood = @property.neighborhoods.find(params[:id])
    end

    def neighborhood_params
        params.require(:neighborhood).permit(:name, :description, :hashtag, :hashtag_description, :city, :tags)
    end
end
