class ChildController < ApplicationController
  getter child = Child.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_child }
  end

  def index
    children = Child.all
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
    child = Child.new child_params.validate!
    if child.save
      redirect_to action: :index, flash: {"success" => "Created child successfully."}
    else
      flash[:danger] = "Could not create Child!"
      render "new.slang"
    end
  end

  def update
    child.set_attributes child_params.validate!
    if child.save
      redirect_to action: :index, flash: {"success" => "Updated child successfully."}
    else
      flash[:danger] = "Could not update Child!"
      render "edit.slang"
    end
  end

  def destroy
    child.destroy
    redirect_to action: :index, flash: {"success" => "Deleted child successfully."}
  end

  private def child_params
    params.validation do
      required :name
      required :age
      required :person_id
    end
  end

  private def set_child
    @child = Child.find! params[:id]
  end
end
