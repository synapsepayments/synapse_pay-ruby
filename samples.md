# User

## Create a user

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"

# This creates an oauth client for the newly created user.
client = SynapsePay::User.create({
  :email => "test-user@synapsepay.com",
  :fullname => "Test Account",
  :ip_address => "11.111.11.11",
  :phonenumber => "123456789"
})
```


## Login as a user

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"

# Returns an oauth client for this user
client = SynapsePay::User.login("username", "password")
```


## Refresh access

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"

client = SynapsePay::Client.refresh_access("refresh-token")

# Alternatively, if you already have a client:
client.refresh_access
```


## Update a user

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

user = client.user.update({
  :fullname => "new fullname",
  # :new_password => "new-secret-password",
  :secret_note => "some secret note"
})

# If you already have a user object:
user.update({
  :fullname => "John Smith"
})
```


## Retrieve a user

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

user = client.user.retrieve

# If you already have a user object, you can refresh:
user.refresh
```


## Search users

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

users = client.user.search("test")
```


# Bank Account

## Link a bank account

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

# Without an MFA
banks = client.banks.link({
  :username => "synapse_nomfa",
  :password => "test1234",
  :bank => "Bank of America"
})
banks # this will be a list of bank accounts

# With a device based MFA
mfa = client.banks.link({
  :username => "synapse_code",
  :password => "test1234",
  :bank => "Bank of America"
})
mfa # this will be a SynapsePay::BankMfaDevice instance
banks = mfa.answer("Bank of America", "test_answer") # this will be a list of bank accounts

# With a question based MFA
mfa = client.banks.link({
  :username => "synapse_good",
  :password => "test1234",
  :bank => "Bank of America"
})
mfa # this will be a SynapsePay::BankMfaQuestions instance
banks = mfa.answer("Bank of America", "test_answer") # this will be a list of bank accounts
```


## Retrieve a bank account

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

banks = client.banks.retrieve("2174")
```

## Add a bank account

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

bank = client.banks.add({
  :fullname => "Jon Smith",
  :account_num => "1111111111",
  :routing_num => "121000358",
  :nickname => "Example bank account",
  :account_type => "1",
  :account_class => "1"
})
```


## Remove a bank account

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

bank = client.banks.remove("2175")

# Or if you have a bank object
bank.remove
```


## List all bank accounts

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

banks = client.banks.all
```


# Orders

## Create an order

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

order = client.orders.create({
  :amount => "100",
  :facilitator_fee => "1",
  :seller_id => "3425",
  :bank_id => "2174"
})
```

## Poll an order

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

order = client.orders.poll("903")
# only the status is set in this order, so access it via order.status
order.status
```


## Update an order

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

order = client.orders.update("903", { :status => 0 })
# or if you have an order object
order.update({ :status => 0 })
```


## Void an order

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

order = client.orders.void("903")
# or if you have an order object
order.void
```


## View recent orders

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

orders = client.orders.recent
```


# Deposits

## Create a deposit

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

deposit = client.deposits.create({
  :bank_id => "2174",
  :amount => "10"
})
```

## Create micro deposits

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

deposits = client.deposits.micro({
  :bank_id => "2174",
  :amount1 => "0.07",
  :amount2 => "0.25"
})
```

## List all deposits

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

deposits = client.deposits.all
```


# Wires

## Create an outgoing wire

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

wire = client.wires.create_outgoing({
  :account_number  => "123456790",
  :routing_number => "064000020",
  :amount => "1000"
})
```


## List all outgoing wires

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

wires = client.wires.all_outgoing
```


## Create an incoming wire

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

wire = client.wires.create_incoming({
  "amount": "10000"
})
```


## List all incoming wires

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

wires = client.wires.all_incoming
```


# Withdrawals

## Create a withdrawal

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

withdrawal = client.withdrawals.create({
  :bank_id => "2174",
  :amount => "15"
})
```


## List all withdrawals

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

withdrawals = client.withdrawals.all
```


# Cards

## Create a card

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

card = client.cards.create({
  :legal_name => "Some Person",
  :account_number => "123456789",
  :routing_number => "123456789",
  :account_class => "1",
  :account_type => "2"
})
```

## Update a card

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

card = client.cards.update("76", {
  :legal_name => "John Smith"
})
# Or if you have the card already
card.update({
  :legal_name => "Jim Halpert"
})
```

## List all cards

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

cards = client.cards.all
```


# Mass Pays

## Create a mass pay

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

# Create a mass pay with bank info
mass_pays = client.mass_pays.create({
  :mass_pays => [
    {
      :legal_name => "Some Person 1",
      :account_number => "888888888",
      :routing_number => "222222222",
      :amount => "10.33",
      :trans_type => "0",
      :account_class => "1",
      :account_type => "2",
      :user_info => {
        :email => "some@email.com",
        :phone_number => "9011234567",
        :ip_address => "some.ip.address",
        :dob => "18/11/1989",
        :risk_score => 10
      }
    },
    {
      :legal_name => "Some Person 2",
      :account_number => "888888888",
      :routing_number => "222222222",
      :amount => "10.33",
      :trans_type => "0",
      :account_class => "1",
      :account_type => "1"
    }
  ]
})


# Create a mass pay with cards
mass_pays = client.mass_pays.create({
  :mass_pays => [
    {
      :amount => "20",
      :trans_type => "0",
      :card_id => "77"
    },
    {
      :amount => "20",
      :trans_type => "0",
      :card_id => "76"
    }
  ]
})
```


## Cancel a mass pay

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

mass_pays = client.mass_pays.cancel("323")
# mass_pays will be a list of mass pays, even though only one was cancelled.

# Or if you already have a mass pay:
mass_pay.cancel
```

## List all mass pays

```ruby
# Make sure we are in Sandbox
SynapsePay.api_base = SynapsePay.api_sandbox

SynapsePay.client_id = "client-id"
SynapsePay.client_secret = "client-secret"
client = SynapsePay::User.login("username", "password")

mass_pays = client.mass_pays.all
```
