%lang starknet
from src.counter.endpoint import (
get_counter_value, 
increment_by_one, 
decrement_by_one, 
double_effect)
from starkware.cairo.common.cairo_builtins import HashBuiltin

@view
func test_increment_by_one{syscall_ptr : felt*, range_check_ptr, pedersen_ptr : HashBuiltin*}():
    let (value) = get_counter_value()
    assert value = 0

    increment_by_one()

    let (value) = get_counter_value()
    assert value = 1

    increment_by_one()
    increment_by_one()

    let (value) = get_counter_value()
    assert value = 3
    return ()
end

@view
func test_decrement_by_one{syscall_ptr : felt*, range_check_ptr, pedersen_ptr : HashBuiltin*}():
    let (value) = get_counter_value()
    assert value = 0

    %{ expect_revert() %}
    decrement_by_one()

    let (value) = get_counter_value()
    assert value = 0

    increment_by_one()
    increment_by_one()
    increment_by_one()
    decrement_by_one()

    let (value) = get_counter_value()
    assert value = 2
    
    decrement_by_one()
    decrement_by_one()

    let (value) = get_counter_value()
    assert value = 0
    return ()
end

@view
func test_double_effect{syscall_ptr : felt*, range_check_ptr, pedersen_ptr : HashBuiltin*}():
    alloc_locals
    local stub_external : felt
    %{ ids.stub_external = deploy_contract("./src/stub_external/endpoint.cairo", []).contract_address %}

    let (value) = get_counter_value()
    assert value = 0

    double_effect(stub_external)

    let (value) = get_counter_value()
    assert value = 0

    increment_by_one()
    double_effect(stub_external)

    let (value) = get_counter_value()
    assert value = 2
    return ()
end
