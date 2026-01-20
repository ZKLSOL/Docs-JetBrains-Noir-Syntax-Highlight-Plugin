// Test examples for Noir
// Demonstrates test patterns and assertions

fn add(a: Field, b: Field) -> Field {
    a + b
}

fn multiply(a: u32, b: u32) -> u32 {
    a * b
}

fn is_even(n: u32) -> bool {
    n % 2 == 0
}

fn factorial(n: u32) -> u32 {
    let mut result: u32 = 1;
    for i in 1..(n + 1) {
        result = result * i;
    }
    result
}

// Basic test
#[test]
fn test_add() {
    let result = add(2, 3);
    assert(result == 5);
}

// Test with multiple assertions
#[test]
fn test_multiply() {
    assert(multiply(2, 3) == 6);
    assert(multiply(0, 5) == 0);
    assert(multiply(1, 7) == 7);
}

// Test boolean function
#[test]
fn test_is_even() {
    assert(is_even(2));
    assert(is_even(4));
    assert(is_even(100));
    assert(!is_even(1));
    assert(!is_even(3));
}

// Test with loop result
#[test]
fn test_factorial() {
    assert(factorial(0) == 1);
    assert(factorial(1) == 1);
    assert(factorial(5) == 120);
}

// Test with array operations
#[test]
fn test_array_sum() {
    let arr = [1, 2, 3, 4, 5];
    let mut sum: u32 = 0;
    for i in 0..5 {
        sum = sum + arr[i];
    }
    assert(sum == 15);
}

// Test with struct
struct TestPoint {
    x: Field,
    y: Field,
}

#[test]
fn test_struct_creation() {
    let p = TestPoint { x: 10, y: 20 };
    assert(p.x == 10);
    assert(p.y == 20);
}

// Test edge cases
#[test]
fn test_edge_cases() {
    // Zero values
    assert(add(0, 0) == 0);
    assert(multiply(0, 100) == 0);

    // Large values
    let large: u32 = 1000000;
    assert(multiply(1, large) == large);
}
