# == Schema Information
# Schema version: 93
#
# Table name: journals
#
#  id         :integer(11)     not null, primary key
#  created_at :datetime
#  date       :datetime        not null
#  memo       :string(255)     not null
#  invoice_id :integer(11)
#  amount     :decimal(9, 2)   default(0.0), not null
#  date_paid  :datetime
#  notes      :text
#  account_id :integer(11)     default(1), not null
#  event_id   :integer(11)
#

class Journal < ActiveRecord::Base
	validates_presence_of :date, :memo, :amount, :account;
  has_many :attachments
	belongs_to :account, :class_name => "Account", :foreign_key => "account_id";
	belongs_to :invoice, :class_name => "Invoice", :foreign_key => "invoice_id";
	belongs_to :event, :class_name => "Event", :foreign_key => "event_id";

	def date_s
		date.strftime('%B %d %Y')
	end
	
	def date_paid_s
		date_paid.strftime('%B %d %Y')
	end
end
