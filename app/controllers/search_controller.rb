class SearchController < ApplicationController

    def index
      if params[:query].present?
        services = Service.search_name(params[:query])
      else
        @services = Service.all
      end
    end
  
       def search
           if params[:location].present?
               @services = Service.near(params[:location])
           else
               @services = Service.all
           end
          #Code hash send info of all agencies to the view to get converted to JSON
          @hash = Gmaps4rails.build_markers(@services) do |service, marker|
          marker.lat service.latitude
          marker.lng service.longitude
            marker.infowindow service.name
          end
      end
  end