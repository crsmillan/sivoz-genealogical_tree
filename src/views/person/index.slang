.row
  .col-sm-11
    h2 People
  .col-sm-1
    a.btn.btn-success.btn-sm href="/people/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Age
        th Actions
    tbody
      - people.each do |person|
        tr
          td = person.name
          td = person.age
          td
            span
              == link_to("Show", "/people/#{person.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/people/#{person.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/people/#{ person.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
