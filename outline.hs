import Control.Monad

data Point t = Point [t] deriving (Show, Read)

data Camera t = Camera {location :: Point t, orientation :: Point t} deriving (Show, Read)

data Edge t = Edge (Point t) (Point t) deriving (Show, Read)

data Pixel = Black | White deriving (Show, Read)

data Row = Row [Pixel] deriving (Show, Read)

data Screen = Screen [Row] deriving (Show, Read)

main = do
    camStr <- getLine
    edgeStr <- getLine
    let cam = read camStr :: Camera Int
        edges = read edgeStr :: [Edge Int]
    putStrLn $ "The camera is at " ++ (show (location cam)) ++ " facing " ++ (show $ orientation cam) ++ "."
    putStrLn $ "This program will eventually be able to determine which of the following edges the camera can see and then draw them:"
    forM edges $ putStrLn . show
