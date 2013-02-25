class Status < ActiveRecord::Base
  attr_accessible :content, :user_id

  # A status belongs to a single user
  belongs_to :user
end
