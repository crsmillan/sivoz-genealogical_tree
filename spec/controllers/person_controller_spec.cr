require "./spec_helper"

def person_hash
  {"name" => "Fake", "age" => "1"}
end

def person_params
  params = [] of String
  params << "name=#{person_hash["name"]}"
  params << "age=#{person_hash["age"]}"
  params.join("&")
end

def create_person
  model = Person.new(person_hash)
  model.save
  model
end

class PersonControllerTest < GarnetSpec::Controller::Test
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

describe PersonControllerTest do
  subject = PersonControllerTest.new

  it "renders person index template" do
    Person.clear
    response = subject.get "/people"

    response.status_code.should eq(200)
    response.body.should contain("people")
  end

  it "renders person show template" do
    Person.clear
    model = create_person
    location = "/people/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Person")
  end

  it "renders person new template" do
    Person.clear
    location = "/people/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Person")
  end

  it "renders person edit template" do
    Person.clear
    model = create_person
    location = "/people/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Person")
  end

  it "creates a person" do
    Person.clear
    response = subject.post "/people", body: person_params

    response.headers["Location"].should eq "/people"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a person" do
    Person.clear
    model = create_person
    response = subject.patch "/people/#{model.id}", body: person_params

    response.headers["Location"].should eq "/people"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a person" do
    Person.clear
    model = create_person
    response = subject.delete "/people/#{model.id}"

    response.headers["Location"].should eq "/people"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
