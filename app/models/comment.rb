class Comment < ActiveRecord::Base
  validates :commenter_id, :artwork_id, presence: true
  validates :body, presence: true

  belongs_to :commenter,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: 'User'

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'Artwork'




end
