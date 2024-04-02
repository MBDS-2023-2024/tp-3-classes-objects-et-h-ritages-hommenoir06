// Partie 1: Création de classes et d'objets (part1.swift)

class Rectangle {
    var length: Double
    var width: Double
    static var numberOfRectangles = 0

    init(length: Double, width: Double) {
        self.length = length
        self.width = width
        Rectangle.numberOfRectangles += 1
    }

    func perimeter() -> Double {
        return 2 * (length + width)
    }

    func area() -> Double {
        return length * width
    }
}

struct RectangleShape: Shape {
    var rectangle: Rectangle

    func area() -> Double {
        return rectangle.area()
    }

    func perimeter() -> Double {
        return rectangle.perimeter()
    }
}

var rectangles: [Shape] = [
    RectangleShape(rectangle: Rectangle(length: 3, width: 4)),
    RectangleShape(rectangle: Rectangle(length: 5, width: 2)),
    RectangleShape(rectangle: Rectangle(length: 6, width: 1))
]

// Ordonner la liste en fonction de la surface
rectangles.sort { $0.area() < $1.area() }

// Afficher le nombre de rectangles créés
print("Nombre de rectangles créés: \(Rectangle.numberOfRectangles)")


// Partie 2: Protocole (part2.swift)

protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}

class Triangle: Shape {
    var base: Double
    var height: Double

    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }

    func area() -> Double {
        return 0.5 * base * height
    }

    func perimeter() -> Double {
        // Perimeter calculation for a triangle depends on the triangle type
        // Assuming it's an equilateral triangle for simplicity
        return 3 * base
    }
}

class Circle: Shape {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }

    func perimeter() -> Double {
        return 2 * Double.pi * radius
    }
}

// Créer une liste contenant trois cercles, deux rectangles et un carré
var shapes: [Shape] = [
    Circle(radius: 3),
    Circle(radius: 5),
    Circle(radius: 2),
    RectangleShape(rectangle: Rectangle(length: 4, width: 4)),
    RectangleShape(rectangle: Rectangle(length: 3, width: 6)),
    Triangle(base: 3, height: 4)
]

// Parcourir la liste et afficher les informations pour chaque élément
for shape in shapes {
    if let rectangleShape = shape as? RectangleShape {
        print("Je suis un rectangle avec une longueur de \(rectangleShape.rectangle.length) et une largeur de \(rectangleShape.rectangle.width). Ma surface est \(rectangleShape.area()) et mon périmètre est \(rectangleShape.perimeter())")
    } else if let circle = shape as? Circle {
        print("Je suis un cercle avec un rayon de \(circle.radius). Ma surface est \(circle.area()) et mon périmètre est \(circle.perimeter())")
    } else if let triangle = shape as? Triangle {
        print("Je suis un triangle avec une base de \(triangle.base) et une hauteur de \(triangle.height). Ma surface est \(triangle.area()) et mon périmètre est \(triangle.perimeter())")
    }
}
