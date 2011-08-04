class Person < ActiveRecord::Base
  has_many :Phone
  #has_many :Adress
  has_and_belongs_to_many :Adress, :class_name => "Adress"
end
