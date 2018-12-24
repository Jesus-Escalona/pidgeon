class TransactionsController < ApplicationController
before_action :authenticate
	def index
		 @transactions = Transaction.all.sort_by {|t| t.created_at.to_i * -1}
	end
end
