class EstablishmentsController < ApplicationController
    before_action :set_property, only: :index
    before_action :set_neighborhood, only: :index
    before_action :set_establishment, only: [ :update, :destroy ]
    before_action :require_admin, only: [ :all, :create, :update, :destroy ]

    def all
        render json: Establishment.all, status: :ok
    end

    def index
        render json: @neighborhood.establishments, status: :ok
    end

    def create
        establishment = Establishment.create(establishment_params)
        render json: establishment, status: :created
    end

    def update
        @establishment.update(establishment_params)
        render json: @establishment, status: :ok
    end

    def destroy
        @establishment.destroy
        render json: { message: "Establishment deleted successfully" }, status: :ok
    end

    private
    def set_property
        @property = Property.find(params[:property_id])
    end

    def set_neighborhood
        @neighborhood = @property.neighborhoods.find(params[:neighborhood_id])
    end

    def set_establishment
        @establishment = Establishment.find(params[:id])
    end

    def establishment_params
        params.require(:establishment).permit(:name, :establishment_category_id, :short, :long, :maps, :string, :cover_image, :tags)
    end
end
