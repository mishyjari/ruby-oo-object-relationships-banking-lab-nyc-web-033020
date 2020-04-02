class Transfer
	# comment
	@@history = []

	attr_accessor :sender, :receiver, :amount, :status

	def initialize (sender,receiver,amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = 'pending'
		Transfer.history << self
	end

	def self.history
		@@history
	end

	def valid?
		#check that both accounts are valid by calling on both account's valid methods
		self.sender.valid? && self.receiver.valid?
	end

	def execute_transaction
		if self.status != "complete"
			if self.valid? && self.sender.balance > self.amount
				self.sender.balance -= self.amount
				self.receiver.balance += self.amount
				self.status = "complete"
			else
				self.status = 'rejected'
				"Transaction rejected. Please check your account balance."
			end	
		end
	end

	def reverse_transfer
		if self.status == "complete"
			self.sender.balance += self.amount
			self.receiver.balance -= self.amount
			self.status = "reversed"
		end
	end
end
