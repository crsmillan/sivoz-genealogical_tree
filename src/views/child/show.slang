h1 Show Child
p = child.name
p = child.age
p = child.person.id
p
  == link_to("Back", "/children", class: "btn btn-light btn-sm")
  == link_to("Edit", "/children/#{child.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/children/#{child.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
