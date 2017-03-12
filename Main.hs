--
-- Copyright (c) 2017 Jarra <suhrawardi@gmail.com>
-- GPL version 2 or later (see http://www.gnu.org/copyleft/gpl.html)
--

module Main where

import Data.Char (toLower)
import Data.List (sort, sortBy)

type Text = String

count = 10

lineCounter :: Text -> String
lineCounter text = show (length (lines text))

wordCounter :: Text -> String
wordCounter text = show (length (words text))

showRun :: (Int, String) -> String
showRun (n, w) = w ++ ": " ++ show n ++ "\n"

countRuns :: [String] -> [(Int, String)]
countRuns []     = []
countRuns (w:ws) = (1 + length us, w):countRuns vs
                   where (us, vs) = span (==w) ws

sortRuns :: [(Int, String)] -> [(Int, String)]
sortRuns = sortBy (flip compare)

commonWords :: Int -> Text -> String
commonWords n = concatMap showRun . take n .
                sortRuns . countRuns . sort .
                words . map toLower

main :: IO ()
main = do content <- getContents
          putStrLn $ lineCounter content ++ " lines"
          putStrLn $ wordCounter content ++ " words"
          putStrLn $ commonWords count content
