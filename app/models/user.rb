class User < ApplicationRecord
	validates_uniqueness_of :username

	has_many :sent_transactions, class_name: "Transaction", foreign_key: "sender_id"
	has_many :received_transactions, class_name: "Transaction", foreign_key: "receiver_id"
	has_many :cards

	has_secure_password

	def receivers
		self.sent_transactions.map {|trans| trans.receiver}
	end

	def senders
		self.received_transactions.map {|trans| trans.sender}
	end

	def sendMoney(amount, id, message)
		@t = Transaction.new(sender_id: self.id, receiver_id: id, amount: amount, message: message)
		if @t.valid?
			@t.save
			self.withdraw(amount)
			User.find(id).deposit(amount)
		else
			#Transaction error.
		end
	end

	def withdraw(amount)
		current_balance = self.balance
		self.update(balance: current_balance - amount)
	end

	def deposit(amount)
		current_balance = self.balance
		self.update(balance: current_balance + amount)
	end
end