class Entry < ActiveRecord::Base
validates :content, :presence => true
belongs_to :report
belongs_to :user
has_many :medium
end