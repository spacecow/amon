class Message < ActiveRecord::Base
  attr_accessible :name, :email, :company, :phone, :subject, :body
  
  validates_presence_of :name, :subject, :body
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end
