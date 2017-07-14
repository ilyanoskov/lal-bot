require 'mongoid'

class User
    include Mongoid::Document
    field :nickname, type: Integer
end