// Struct examples for Noir
// Demonstrates struct definitions and usage

struct Point {
    x: Field,
    y: Field,
}

struct User {
    id: Field,
    balance: u64,
    is_active: bool,
}

struct ComplexType {
    point: Point,
    values: [Field; 3],
    count: u32,
}

impl Point {
    fn new(x: Field, y: Field) -> Self {
        Point { x, y }
    }

    fn origin() -> Self {
        Point { x: 0, y: 0 }
    }

    fn add(self, other: Point) -> Point {
        Point {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }

    fn scale(self, factor: Field) -> Point {
        Point {
            x: self.x * factor,
            y: self.y * factor,
        }
    }
}

impl User {
    fn new(id: Field, balance: u64) -> Self {
        User {
            id,
            balance,
            is_active: true,
        }
    }

    fn deactivate(self) -> Self {
        User {
            id: self.id,
            balance: self.balance,
            is_active: false,
        }
    }
}

fn create_point() -> Point {
    Point::new(10, 20)
}

fn use_structs() {
    let p1 = Point::new(1, 2);
    let p2 = Point::new(3, 4);
    let p3 = p1.add(p2);

    let user = User::new(1, 1000);
    let inactive = user.deactivate();

    let complex = ComplexType {
        point: p3,
        values: [1, 2, 3],
        count: 5,
    };
}

#[test]
fn test_point_add() {
    let p1 = Point::new(1, 2);
    let p2 = Point::new(3, 4);
    let result = p1.add(p2);
    assert(result.x == 4);
    assert(result.y == 6);
}

#[test]
fn test_point_scale() {
    let p = Point::new(2, 3);
    let scaled = p.scale(2);
    assert(scaled.x == 4);
    assert(scaled.y == 6);
}
