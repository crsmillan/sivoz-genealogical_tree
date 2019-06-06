require "./spec_helper"
require "../../src/models/person.cr"

describe Person do
  Spec.before_each do
    Person.clear
  end
end
