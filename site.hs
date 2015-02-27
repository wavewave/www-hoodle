{-# LANGUAGE OverloadedStrings #-}
module Main where

-- import Control.Arrow ((>>>),(>>^),(^>>),arr,second)
import Control.Applicative
import Data.Monoid
import Hakyll
import System.FilePath
import System.Directory
import System.IO 


main :: IO ()
main = do 
  homedir <- getHomeDirectory 
  str <- readFile (homedir </> ".www-hoodle")  
  let rdir = head (lines str)
  hakyllWith (deploysetup rdir) $ do
    match "gallery/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "templates/*" $ compile templateCompiler

    match (fromList [ "index.markdown"
                    , "installation.markdown"
                    , "download.markdown"
                    , "documentation.markdown"
                    , "gallery.markdown"
                    , "development.markdown"
                    , "discuss.markdown"
                    ]) $ do 
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls


-- setImgURL = setURL "png"
-- setHtmlURL = setURL "html"
-- setURL ext p = trySetField (ext ++ "url") (replaceExtension (getField "url" p) ext) p

deploysetup :: String -> Configuration
deploysetup str = defaultConfiguration { 
                    deployCommand = "rsync -ave 'ssh' _site/* " ++ str 
                  } 
