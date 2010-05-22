class Bookmarklet < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :code
  validate :spam_check

  default_scope :conditions => { :spam => false }

  attr_accessor :body # This is for spam detection

  private

  def spam_check
    if self.spam = @body || SpamChecker.new(code).spam?
      errors.add(:spam, "detection failed.")
    end
  end
end
