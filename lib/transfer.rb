require 'pry'
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
		sender_acct = BankAccount.all.select do | sender | 
			sender.name == self.sender
		end
		receiver_acct = BankAccount.all.select do | receiver |
			receiver.name == self.receiver
		end
		sender_acct.status == 'open' && receiver_acct.status == 'open'
		binding.pry
	end

	def execute_transation
		# Execute Successful transaction
		# Each transaction can only happen once
		# Reject on insufficient funds
	end

	def reverse_transfer
		# Reverse a transfer only if its been executed
	end
end
