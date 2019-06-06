class PersonController < ApplicationController
  getter person = Person.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_person }
  end

  def index
    people = Person.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    person = Person.new person_params.validate!
    if person.save
      redirect_to action: :index, flash: {"success" => "Created person successfully."}
    else
      flash[:danger] = "Could not create Person!"
      render "new.slang"
    end
  end

  def update
    person.set_attributes person_params.validate!
    if person.save
      redirect_to action: :index, flash: {"success" => "Updated person successfully."}
    else
      flash[:danger] = "Could not update Person!"
      render "edit.slang"
    end
  end

  def destroy
    person.destroy
    redirect_to action: :index, flash: {"success" => "Deleted person successfully."}
  end

  private def person_params
    params.validation do
      required :name
      required :age
    end
  end

  private def set_person
    @person = Person.find! params[:id]
  end
end
