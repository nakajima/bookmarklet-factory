class Bookmarklet < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :code
  validate :spam_check, :if => :spam?

  attr_accessor :body # This is for spam detection

  def spam?
    @body || SpamChecker.new(code).spam?
  end

  private

  def spam_check
    errors.add(:spam, "detection failed.")
  end
end
