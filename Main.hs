--
-- Copyright (c) 2017 Jarra <suhrawardi@gmail.com>
-- GPL version 2 or later (see http://www.gnu.org/copyleft/gpl.html)
--

module Main where

import WordCounter
import SimpleJSON
import PrettyJSON
import Prettify
import GlobRegex

-- Count Words
-- main :: IO ()
-- main = countWords

main :: IO ()
main = putStrLn (pretty 20 value)
       where value = renderJValue (JObject [("foo", JNumber 1), ("bar", JBool False)])
