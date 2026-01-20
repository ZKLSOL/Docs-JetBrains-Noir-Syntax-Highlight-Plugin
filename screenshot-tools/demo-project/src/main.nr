use std::hash::poseidon;

struct User {
    id: Field,
    name: str<32>,
    balance: u64,
    is_active: bool,
}

fn main(x: Field, y: Field) -> pub Field {
    let result = add_fields(x, y);
    let hash = poseidon::bn254::hash_1([result]);
    hash
}

fn add_fields(a: Field, b: Field) -> Field {
    a + b
}

fn multiply(a: u32, b: u32) -> u32 {
    a * b
}

fn create_user(id: Field, balance: u64) -> User {
    User {
        id,
        name: "Demo User",
        balance,
        is_active: true,
    }
}

fn process_array(arr: [Field; 5]) -> Field {
    let mut sum: Field = 0;
    for i in 0..5 {
        sum = sum + arr[i];
    }
    sum
}

#[test]
fn test_add_fields() {
    let result = add_fields(2, 3);
    assert(result == 5);
}

#[test]
fn test_multiply() {
    let result = multiply(4, 5);
    assert(result == 20);
}

#[test]
fn test_process_array() {
    let arr = [1, 2, 3, 4, 5];
    let sum = process_array(arr);
    assert(sum == 15);
}
