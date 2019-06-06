require "./spec_helper"

def child_hash
  {"name" => "Fake", "age" => "1", "person_id" => "1"}
end

def child_params
  params = [] of String
  params << "name=#{child_hash["name"]}"
  params << "age=#{child_hash["age"]}"
  params << "person_id=#{child_hash["person_id"]}"
  params.join("&")
end

def create_child
  model = Child.new(child_hash)
  model.save
  model
end

class ChildControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe ChildControllerTest do
  subject = ChildControllerTest.new

  it "renders child index template" do
    Child.clear
    response = subject.get "/children"

    response.status_code.should eq(200)
    response.body.should contain("children")
  end

  it "renders child show template" do
    Child.clear
    model = create_child
    location = "/children/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Child")
  end

  it "renders child new template" do
    Child.clear
    location = "/children/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Child")
  end

  it "renders child edit template" do
    Child.clear
    model = create_child
    location = "/children/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Child")
  end

  it "creates a child" do
    Child.clear
    response = subject.post "/children", body: child_params

    response.headers["Location"].should eq "/children"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a child" do
    Child.clear
    model = create_child
    response = subject.patch "/children/#{model.id}", body: child_params

    response.headers["Location"].should eq "/children"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a child" do
    Child.clear
    model = create_child
    response = subject.delete "/children/#{model.id}"

    response.headers["Location"].should eq "/children"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
