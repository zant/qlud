{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_qlud (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/gonza/dev/haskell/qlud/.stack-work/install/x86_64-osx/61ec44d731590469134eb19da74a972e7241b36af8a203023066b440e11158f8/8.10.7/bin"
libdir     = "/Users/gonza/dev/haskell/qlud/.stack-work/install/x86_64-osx/61ec44d731590469134eb19da74a972e7241b36af8a203023066b440e11158f8/8.10.7/lib/x86_64-osx-ghc-8.10.7/qlud-0.1.0.0-8V5F2iAZozC6C4dq2O8IBI-qlud"
dynlibdir  = "/Users/gonza/dev/haskell/qlud/.stack-work/install/x86_64-osx/61ec44d731590469134eb19da74a972e7241b36af8a203023066b440e11158f8/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/gonza/dev/haskell/qlud/.stack-work/install/x86_64-osx/61ec44d731590469134eb19da74a972e7241b36af8a203023066b440e11158f8/8.10.7/share/x86_64-osx-ghc-8.10.7/qlud-0.1.0.0"
libexecdir = "/Users/gonza/dev/haskell/qlud/.stack-work/install/x86_64-osx/61ec44d731590469134eb19da74a972e7241b36af8a203023066b440e11158f8/8.10.7/libexec/x86_64-osx-ghc-8.10.7/qlud-0.1.0.0"
sysconfdir = "/Users/gonza/dev/haskell/qlud/.stack-work/install/x86_64-osx/61ec44d731590469134eb19da74a972e7241b36af8a203023066b440e11158f8/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "qlud_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "qlud_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "qlud_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "qlud_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "qlud_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "qlud_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
