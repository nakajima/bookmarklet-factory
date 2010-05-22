class Bookmarklet < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :code
  validate :spam_check, :if => :spam?

  before_create :highlight_code!, :if => :code?

  attr_accessor :body # This is for spam detection

  def spam?
    @body.present? || SpamChecker.new(code).spam?
  end

  def highlighted_code
    self[:highlighted_code] || begin
      highlight_code!
      save!
      highlighted_code
    rescue
      code
    end
  end

  private

  def highlight_code!
    self.highlighted_code = Net::HTTP.post_form(URI.parse('http://pygments.appspot.com/'), {
      'lang' => 'javascript',
      'code' => code
    }).body
  end

  def spam_check
    errors.add(:spam, "detection failed.")
  end
end
