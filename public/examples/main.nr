// Basic Noir syntax demonstration
// This file shows various syntax elements for plugin feature testing

use std::hash::poseidon;

fn main(x: Field, y: Field) -> pub Field {
    let sum = add(x, y);
    let hash = poseidon::bn254::hash_1([sum]);
    hash
}

fn add(a: Field, b: Field) -> Field {
    a + b
}

#[test]
fn test_add() {
    let result = add(2, 3);
    assert(result == 5);
}
