- if person.errors
  ul.errors
    - person.errors.each do |error|
      li = error.to_s

== form(action: "/people/#{person.id.to_s}", method: person.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: person.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "age", value: person.age, placeholder: "Age", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/people", class: "btn btn-light btn-sm")
