class Post < ActiveRecord::Base
  validates :title, presence: true, format: {with: /\A\d/}

  before_create do
    self.content = title if content.blank?
  end

end
