class API::V1::PeopleController < ApplicationController
 	def index
    @people = Person.all
    respond_to do |format|
      format.json { render :json => @people }
    end
	end

	def create
		@people = Person.new(person_params)

    respond_to do |format|
      if @people.save
        format.json { render :json => @people }
      else
        format.json { render :json => @people.errors, status: :unprocessable_entity }
      end
    end
	end

	private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :city, :country)
    end
end