class Video < ApplicationRecord
  has_many :annotations

  include PgSearch::Model
  pg_search_scope :search_by_video_title_and_tags,
    against: [ :title, :tags ],
    using: {
      tsearch: { prefix: true }
    }

  include PgSearch::Model
  multisearchable against: [:title, :tags],
    using: {
      tsearch: { prefix: true }
    }
end
