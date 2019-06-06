class Person < Granite::Base
  adapter pg
  table_name people

  primary id : Int64
  field name : String
  field age : Int32

  has_many :children
  timestamps
end
