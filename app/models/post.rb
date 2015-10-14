class Post < ActiveRecord::Base
  validates :title, presence: true, format: {with: /\A\d/}
  before_create :gen_content

  def gen_content
    self.content = title if content.blank?
  end

end
