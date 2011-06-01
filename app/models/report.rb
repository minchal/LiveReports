class Report < ActiveRecord::Base
validates :title, :presence => true
validates :description, :presence => true

has_many :chat_entry
has_many :entry
end
