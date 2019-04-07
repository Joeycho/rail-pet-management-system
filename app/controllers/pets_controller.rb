class PetsController < ApplicationController
  include ApplicationHelper

  def new
    @owner = Owner.find_by(id: params[:owner_id])
  end

  def create
    redirect_if_not_logged_in
    if Clinic.available_clinic.exists?(pet_params[:clinic_id])
      @pet = Pet.create(pet_params)
      redirect_to owner_pet_path(@pet.owner.id,@pet)
    else
      flash[:full]= "Current clinic is full with other pets. Choose other clinic for your pet"
      redirect_to new_owner_pet_path(current_owner)
    end

  end

  def destroy
    redirect_if_not_logged_in
          @pet = Pet.find_by(id: params[:id])
          if @pet == nil
            flash[:message]="The pet is not found in database"
          elsif current_owner.id == @pet.owner_id
            flash[:message]="#{@pet.name} is gone"
            @pet.delete
          else
            flash[:message]="You are not allowed to delete this pet"
          end
            redirect_to owner_path(current_owner)
  end

  def show
    redirect_if_not_logged_in
    @pet = Pet.find_by(id: params[:id])
  end

  def edit
    redirect_if_not_logged_in
             if Pet.find(params[:id]) == nil
               flash[:message]="There is no information about this pet"
               redirect_to owner_path(current_owner)
             elsif current_owner.id == Pet.find(params[:id]).owner.id
               @pet = Pet.find(params[:id])
               render 'edit'
             else
               flash[:message]="You are not allowed to edit this pet's information"
               redirect_to owner_path(current_owner)
             end

  end

  def update
    redirect_if_not_logged_in
         @pet = Pet.find(params[:id])
         if current_owner.id != @pet.owner_id
             flash[:message] = "It is not your pet!!"
             redirect_to owner_path(current_owner)
         else
           updated = @pet.update(name: pet_params[:name],breed: pet_params[:breed],desc: pet_params[:desc],clinic_id: pet_params[:clinic_id])
           return redirect_to edit_owner_pet_path(@pet.owner.id, @pet) unless updated
           flash[:update] = "Your pet information was updated"
           redirect_to owner_pet_path(@pet.owner)
         end
  end

  def index
    redirect_if_not_logged_in
    @owner = Owner.find_by(id: current_owner[:id])
    @pets =  @owner.pets
  end

  private

  def pet_params
    params.require(:pet).permit(:id,:name,:breed,:desc,:owner_id,:clinic_id)
  end
end
