class User
    include Mongoid::Document
    field :nickname, type: String
    field :isAdmin, type: Boolean, default: false
end