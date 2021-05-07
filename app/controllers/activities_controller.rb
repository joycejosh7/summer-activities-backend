class ActivitiesController < ApplicationController
    before_action :find_activity, only: [:show, :update, :destroy]
    def index
        activity = Activity.all 
        # render json: activity
        render json: Activity.arr_to_json
        #json behind the scenes turns your hash into a string
        #http can only send/receive/read information in STRING format

    end 

    
    def show
        activity = Activity.find(params[:id])
        render json: activity.instance_to_json 
    end 

    def create
        activity = Activity.new(activity_params)
        creator = Creator.find_or_create_by(name: params[:creator])
        activity.creator_id =  creator.id
        if activity.save
            render json: activity.instance_to_json
        else 
            render json: activity.errors, status: :unprocessable_entity
        end
    end 

    def update
        activity = Activity.find_by(id:params[:id])
        if activity.save
            render json: activity.instance_to_json
        else 
            render json: activity.errors, status: :unprocessable_entity
        end
    end 

    def destroy
        p "*" * 99
        activity = Activity.find(params[:id])
        p activity
        activity.destroy

        render json: activity.instance_to_json
    end


    private 

    def find_activity
        activity = Activity.find(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:title,:description,:creator_id)
    end
end
