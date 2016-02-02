{-# LANGUAGE OverloadedStrings #-}

import Lucid.Svg
import Data.Monoid
import Data.Text.Lazy as T

svg :: Element -> Element
svg content =
     doctype_
  <> with (svg11_ content) [Version <-- "1.1", Width <-- "300", Height <-- "200"]

contents :: Element
contents =
     rect_   [ Width <-- "100%", Height <-- "100%", "red" --> Fill] nil
  <> circle_ [ Cx <-- "150", Cy <-- "100", R <-- "80", Fill <-- "green"] nil
  <> text_   [ X <-- "150", Y <-- "125", Font_size <-- "60"
             , Text_anchor <-- "middle", Fill <-- "white"] "SVG"

main :: IO ()
main = do
  print $ svg contents
