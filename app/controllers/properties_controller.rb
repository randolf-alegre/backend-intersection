class PropertiesController < ApplicationController
    before_action :set_property, only: [ :update, :destroy ]
    before_action :property_params, only: :create
    before_action :require_admin, only: [ :create, :update, :destroy, :associate_neighborhoods ]

    def index
        render json: paginated(Property.all)
    end

    def create
        property = Property.create(property_params)
        render json: property
    end

    def associate_neighborhoods
        property = Property.find(params[:property])
        neighborhoods = Neighborhood.where(id: params[:neighborhood_ids]).where.not(id: property.neighborhood_ids)
        property.neighborhoods << neighborhoods
        render json: property
    end

    def update
        @property.update(property_params)
        render json: @property
    end

    def destroy
        @property.destroy
        render json: { message: "Property deleted successfully" }
    end

    def search
        scope = Property.all
        if params[:name].present?
            scope = scope.where("LOWER(name) = LOWER(?)", params[:name])
            return render json: { error: "Property not found" }, status: :not_found unless scope.exists?
        end

        render json: paginated(scope)
    end

    private

    def property_params
        params.require(:property).permit(:name, :description, :address)
    end

    def set_property
        @property = Property.find(params[:id])
    end

    def associate_neighborhood_params
        params.require(:property).permit(neighborhood_ids: [])
    end
end
