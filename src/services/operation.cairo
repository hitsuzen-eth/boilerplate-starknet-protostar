%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

func multiply{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    _a : felt, _b : felt) -> (res : felt):

    let res = _a * _b

    return (res)
end

func plus{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    _a : felt, _b : felt) -> (res : felt):

    let res = _a + _b

    return (res)
end

func minus{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    _a : felt, _b : felt) -> (res : felt):

    let res = _a - _b

    return (res)
end