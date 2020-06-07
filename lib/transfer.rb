class Transfer

  attr_accessor :status, :balance, :sender, :receiver, :amount

  def initialize(sender, receiver, amount) # can initialize a Transfer, initializes with a sender, initializes with a receiver, always initializes with a status of 'pending', initializes with a transfer amount 
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
    
  def valid? # can check that both accounts are valid, calls on the sender and receiver's #valid? methods
    sender.valid? && receiver.valid?
  end

  def execute_transaction # can execute a successful transaction between two accounts, each transfer can only happen once, rejects a transfer if the sender does not have enough funds (does not have a valid account)
    if sender.balance >= @amount && @status == "pending" && sender.valid? && receiver.valid?
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end  
  
  def reverse_transfer # can reverse a transfer between two accounts, it can only reverse executed transfers 
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end