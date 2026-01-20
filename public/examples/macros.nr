// Macro examples for Noir
// Demonstrates macro usage and expansion

#[oracle(get_random)]
unconstrained fn get_random() -> Field {}

#[oracle(get_timestamp)]
unconstrained fn get_timestamp() -> u64 {}

#[oracle(read_storage)]
unconstrained fn read_storage(key: Field) -> Field {}

fn main(secret: Field) -> pub Field {
    // Use oracle in unconstrained context
    let random = unsafe { get_random() };

    // Combine with input
    secret + random
}

// Attribute macros
#[test]
fn test_with_attribute() {
    assert(1 + 1 == 2);
}

#[allow(unused)]
fn unused_function() {
    // This function is intentionally unused
}

// Multiple attributes
#[test]
#[allow(unused)]
fn test_multiple_attributes() {
    let _ = 42;
}

// Oracle pattern for external data
fn verify_with_oracle(expected: Field) {
    let actual = unsafe { read_storage(0) };
    assert(actual == expected);
}

// Demonstrating unconstrained blocks
fn computation_with_hint(x: Field) -> Field {
    // Get a hint from unconstrained code
    let hint = unsafe {
        // Complex computation here
        x * x
    };

    // Verify the hint in constrained code
    assert(hint == x * x);
    hint
}

#[test]
fn test_computation() {
    let result = computation_with_hint(5);
    assert(result == 25);
}
