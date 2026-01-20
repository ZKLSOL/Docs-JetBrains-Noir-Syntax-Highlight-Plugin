// Function examples for Noir
// Demonstrates various function patterns

fn simple_function() {
    // Function with no parameters or return
}

fn with_params(a: Field, b: Field) {
    // Function with parameters
    let _ = a + b;
}

fn with_return(x: u32) -> u32 {
    // Function with return type
    x * 2
}

fn with_public_return(input: Field) -> pub Field {
    // Public return for circuit output
    input
}

pub fn public_function() {
    // Publicly visible function
}

fn generic_function<T>(value: T) -> T {
    value
}

fn with_array_param(arr: [Field; 5]) -> Field {
    let mut sum: Field = 0;
    for i in 0..5 {
        sum = sum + arr[i];
    }
    sum
}

unconstrained fn unconstrained_helper() -> Field {
    // Unconstrained function - not proven
    42
}

#[oracle(external_call)]
unconstrained fn oracle_function() -> Field {}

#[test]
fn test_with_return() {
    assert(with_return(5) == 10);
}

#[test]
fn test_array_sum() {
    let arr = [1, 2, 3, 4, 5];
    assert(with_array_param(arr) == 15);
}
