import Control.Monad
import System.Environment
import System.IO

data Point t = Point [t] deriving (Show, Read)

data Camera t = Camera {location :: Point t, orientation :: Point t} deriving (Show, Read)

data Edge t = Edge (Point t) (Point t) deriving (Show, Read)

data Pixel = Black | White deriving (Show, Read)

data Row = Row [Pixel] deriving (Show, Read)

data Screen = Screen [Row] deriving (Show, Read)

subPoint :: (Num t) => Point t -> Point t -> Either String (Point t)
subPoint (Point []) (Point []) = Right (Point [])
subPoint (Point []) _ = Left "Point1 has fewer dimensions than Point2"
subPoint _ (Point []) = Left "Point2 has fewer dimensions than Point1"
subPoint (Point (a : arest)) (Point (b : brest)) = 
    let rest = (Point arest) `subPoint` (Point brest)
    in case rest of
        Left error -> Left error
        Right (Point otherDimensions) -> Right (Point ((a - b) : otherDimensions))

main = do
    (file:otherArgs) <- getArgs
    (camStr, edgeStr) <- withFile file ReadMode (\handle -> do
                            camStr <- hGetLine handle
                            edgeStr <- hGetLine handle
                            return (camStr, edgeStr))
    let cam = read camStr :: Camera Int
        edges = read edgeStr :: [Edge Int]
    putStrLn $ "The camera is at " ++ (show (location cam)) ++ " facing " ++ (show $ orientation cam) ++ "."
    putStrLn $ "This program will eventually be able to determine which of the following edges the camera can see and then draw them:"
    forM edges $ putStrLn . show
