class Transaction < ApplicationRecord

	validates :amount, presence: true, numericality: {greater_than: 0}
	validate :amount_not_higher_than_balance

	belongs_to :sender, class_name: "User"
	belongs_to :receiver, class_name: "User"

	def amount_not_higher_than_balance
		if self.sender.balance < self.amount
			errors.add(:amount, "Not enough funds in balance")
		end
	end


end
