class BankAccount

    attr_reader :name # can't change its name
    attr_accessor :balance, :status

    def initialize(name) # can initialize a Bank Account, initializes with a name, always initializes with balance of 1000, always initializes with a status of 'open'
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit_amount) # can deposit money into its account
        @balance += deposit_amount
    end

    def display_balance # can display its balance
        "Your balance is $#{@balance}."
    end

    def valid? # is valid with an open status and a balance greater than 0
        @status == "open" && @balance > 0
    end

    def close_account # can close its account
        @status = "closed"
    end

end