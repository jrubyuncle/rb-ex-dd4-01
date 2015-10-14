class Post < ActiveRecord::Base
  validates :title, presence: true, format: {with: /\A\d/}
  before_create :gen_content
  before_save :upcase_all

  protected
  def gen_content
    self.content = title if content.blank?
  end

  def upcase_all
    title.try(:upcase!)
    content.try(:upcase!)
  end

end
