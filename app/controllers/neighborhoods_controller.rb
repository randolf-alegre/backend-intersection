class NeighborhoodsController < ApplicationController
    before_action :set_property, only: [ :index ]
    before_action :set_neighborhood, only: [ :update, :destroy ]
    before_action :require_admin, only: [ :create, :update, :destroy, :all, :associate_properties, :associate_establishments ]

    def all
        render json: Neighborhood.all, status: :ok
    end

    def index
        render json: @property.neighborhoods, status: :ok
    end

    def associate_properties
        neighborhood = Neighborhood.find(params[:neighborhood])
        properties = Property.where(id: params[:property_ids]).where.not(id: neighborhood.property_ids)
        neighborhood.properties << properties
        render json: neighborhood, status: :ok
    end

    def associate_establishments
        neighborhood = Neighborhood.find(params[:neighborhood])
        establishments = Establishment.where(id: params[:establishment_ids]).where.not(id: neighborhood.establishment_ids)
        neighborhood.establishments << establishments
        render json: neighborhood, status: :ok
    end

    def create
        neighborhood = Neighborhood.create(neighborhood_params)
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
        @neighborhood = Neighborhood.find(params[:id])
    end

    def neighborhood_params
        params.require(:neighborhood).permit(:name, :description, :hashtag, :hashtag_description, :city, :tags)
    end

    def associate_properties_params
        params.require(:neighborhood).permit(property_ids: [])
    end

    def associate_establishments_params
        params.require(:neighborhood).permit(establishment_ids: [])
    end
end
