
# Piggy bank contract

# Var: Owner of the piggy bank (tx.origin) 
# Var: Name of the piggy bank
# Var: Expiration date, when the piggy bank can be broken
# Var: Total amount of money in the piggy bank

# We need a struct for the piggy banks/owners

owner: public(address)
name: public(String[100])
expiration_date: public(uint256)
total_amount: uint256


# Func: init
# Func: change the name of the piggy bank
# Func: Amount of money that any user is putting into the piggy bank
# Func: withdrawing the money

@external
def __init__(_name: String[100], _expiration_date: uint256):
    assert block.timestamp < _expiration_date
    self.owner = tx.origin
    self.name = _name
    self.expiration_date = _expiration_date

@external
def set_name(_name: String[100]):
    assert self.owner == msg.sender
    self.name = _name

@payable
@external
def donate():
    self.total_amount += msg.value

@external
@view
def get_total_amount() -> uint256:
    return self.total_amount


    




