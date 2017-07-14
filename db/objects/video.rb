class Video
    include Mongoid::Document
    field :title, type: String
    field :votes, type: Integer, default: 0
    field :description, type: String
    field :watched, type: Boolean, default: false
end
