# @version ^0.2.0
owner: public(address)
name: public(String[100])
expiration_date: public(uint256)
total_amount: uint256

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

@view
@external
def get_total_amount() -> uint256:
    return self.total_amount