class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  @@all = []

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > self.amount
  end

  def execute_transaction
    if self.status == "complete"
    elsif self.valid?
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "reversed"
    elsif self.status == "complete"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end