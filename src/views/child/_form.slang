- if child.errors
  ul.errors
    - child.errors.each do |error|
      li = error.to_s

== form(action: "/children/#{child.id.to_s}", method: child.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: child.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "age", value: child.age, placeholder: "Age", class: "form-control")
  .form-group
    == label(:person)
    == select_field(name: "person_id", collection: Person.all.map{|person| [person.id, person.id]}, selected: child.person_id, class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/children", class: "btn btn-light btn-sm")
