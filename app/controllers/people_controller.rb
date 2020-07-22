class PeopleController < ApplicationController
  def new
    @person = Person.new
    #we need this for the fields_for :addresses to appear on the page
    #when we first create a Person they do not have an address
    #so f.fields_for :addresses will have no address fields if there are no addresses
    @person.addresses.build(address_type: 'work')
    @person.addresses.build(address_type: 'home')
  end

  def create    
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(
      :name,
      addresses_attributes: [
        :street_address_1,
        :street_address_2,
        :city,
        :state,
        :zipcode,
        :address_type
      ]
    )
  end
end
