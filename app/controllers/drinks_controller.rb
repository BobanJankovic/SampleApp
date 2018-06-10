class DrinksController < ApplicationController

    #STANDARD SET OF [REST] METHODS THERE ARE 7 OF THEM


    def index #display list of drinks,template
        #sada sam u index action napraviti template
        @drinks=Drink.all
        
    end

    def show #display records of individual drinks,template
        @drink=Drink.find(params[:id])
    end

    def new #display the form for the new Record,template 
        @drink=Drink.new
    end

    def create #save new record and redirect
        @drink=Drink.new(allowed_params)
        if @drink.save
            redirect_to drinks_path
        else
            renderer 'new'
        end
    end

    def edit #display form for the existing method,template
        @drink=Drink.find(params[:id])
    end

    def update #save changes and redirect
        @drink=Drink.find(params[:id])
        if @drink.update_attributes(allowed_params)
            redirect_to drinks_path
        else
            renderer 'new'
        end
    end

    def destroy #delete and redirect
        @drink=Drink.find(params[:id])
        @drink.destroy
        redirect_to drinks_path

        
    end

    def allowed_params
        params.require(:drink).permit(:name,:size)
    end


end
