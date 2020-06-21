class Api::BenchesController < ApplicationController

    def index
        @benches = Bench.all 
        render :index 
    end

    def create
        @bench = Bench.new (params.require(:bench).permit(:description, :lat, :lng))
        if @bench.save
            render json: @bench 
        else
            render json: @bench.errors.full_messages
        end
    end

end
