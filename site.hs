{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Arrow ((>>>),(>>^),(^>>),arr,second)

import System.FilePath
import System.Directory
import System.IO 

import Hakyll

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

    match (list [ "index.markdown"
                , "installation.markdown"
                , "download.markdown"
                , "documentation.markdown"
                , "gallery.markdown"
                , "development.markdown"]) $ do 
        route   $ setExtension "html"
        compile $ pageCompiler
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler


setImgURL = setURL "png"
setHtmlURL = setURL "html"
setURL ext p = trySetField (ext ++ "url") (replaceExtension (getField "url" p) ext) p

deploysetup :: String -> HakyllConfiguration
deploysetup str = defaultHakyllConfiguration { 
                    deployCommand = "rsync -ave 'ssh' _site/* " ++ str 
                  } 