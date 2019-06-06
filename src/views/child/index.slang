.row
  .col-sm-11
    h2 Children
  .col-sm-1
    a.btn.btn-success.btn-sm href="/children/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Age
        th Person
        th Actions
    tbody
      - children.each do |child|
        tr
          td = child.name
          td = child.age
          td = child.person.name
          td
            span
              == link_to("Show", "/children/#{child.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/children/#{child.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/children/#{ child.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
