class Child < Granite::Base
  adapter pg
  table_name children

  belongs_to :person

  primary id : Int64
  field name : String
  field age : Int32
  timestamps
end
