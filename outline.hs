data Point t = Point t t t

type Orientation t = Point t

data Camera t = Camera (Point t) (Orientation t)

data Edge t = Edge (Point t) (Point t)
