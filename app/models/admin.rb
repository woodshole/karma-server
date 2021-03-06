# An Admin is an account that is used by a person to access the
# karma server's HTML interface. 
#
# A super admin has permission to create, modify, or delete any
# admin on the system. An admin only has permission to modify 
# themsleves (with the exception of their super admin status).
class Admin < ActiveRecord::Base

  acts_as_authentic
    
  validates_presence_of :name, :message => "can't be blank"

end




# == Schema Information
#
# Table name: admins
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  login             :string(255)     not null
#  crypted_password  :string(255)     not null
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#

