data Point t = Point [t] deriving (Show, Read)

type FocalPoint = Point

data Camera t = Camera (Point t) (FocalPoint t) deriving (Show, Read)

data Edge t = Edge (Point t) (Point t) deriving (Show, Read)

data Pixel = Black | White deriving (Show, Read)

data Row = [pixel] deriving (Show, Read)

data Screen = Screen [Row] deriving (Show, Read)

