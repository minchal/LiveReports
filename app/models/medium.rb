class Medium < ActiveRecord::Base

validates :data, :presence => true
validates :mtype, :presence => true
belongs_to :entry
end
