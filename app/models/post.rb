class Post < ActiveRecord::Base
  validates :title, presence: true, format: {with: /\A\d/}
end
