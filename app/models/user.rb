class User < ActiveRecord::Base
  validates_presence_of :email_address
  validates_uniqueness_of :email_address
  validates_format_of :email_address,
  :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
end
