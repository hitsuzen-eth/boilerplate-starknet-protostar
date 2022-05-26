%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import (get_caller_address, get_contract_address)

@storage_var
func value() -> (res : felt):
end

@constructor
func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    set_value(0)

    return()
end


func set_value{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    _value : felt):

    value.write(_value)
    
    return ()
end

func get_value{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
) -> (value_now : felt):

    let (value_now) = value.read()
    return (value_now)
end