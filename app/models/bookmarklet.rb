class Bookmarklet < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :code
  validate :spam_check, :if => :spam?

  before_save :highlight_code!, :if => :code?

  attr_accessor :body # This is for spam detection

  def spam?
    @body.present? || SpamChecker.new(code).spam?
  end

  def code
    if jquery?
      jquery = <<-JS
        var _jq = document.createElement('script');
        _jq.src = 'http://code.jquery.com/jquery.js';
        _jq.type = 'text/javascript';
        document.getElementsByTagName('head')[0].appendChild(_jq);
      JS
      jquery.gsub!(/^\s*/, '')

      wrapped_code = <<-JS
        window.setTimeout(function() {
          jQuery.noConflict();
          #{self[:code]}
        }, 10);
      JS

      [jquery, wrapped_code].join("\n")
    else
      self[:code]
    end
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
      'code' => self[:code]
    }).body
  end

  def spam_check
    errors.add(:spam, "detection failed.")
  end
end
