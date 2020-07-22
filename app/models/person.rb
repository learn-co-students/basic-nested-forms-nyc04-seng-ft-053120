class Person < ActiveRecord::Base
  has_many :addresses
  #cant use this when we want to avoid duplicates of the row we are creating
  accepts_nested_attributes_for :addresses

end
