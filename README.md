# cpp-bootstrap

<a href="http://www.wtfpl.net/"><img src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl.svg" height="20" alt="WTFPL" /></a> [![Build Status](https://travis-ci.org/vtta/cpp-bootstrap.svg?branch=master)](https://travis-ci.org/vtta/cpp-bootstrap)

A CMake template for modern C++ projects with Conan as dependency manager

# Feature

- Universal building with cmake and conan
- Full integration with checker and linter
  - Clang-tidy
  - Clang-format
  - cppcheck

# Getting started

## What you need

- A modern [C++ compiler](https://clang.llvm.org)
- [CMake](https://cmake.org) 3.15 or newer
- [Conan](https://conan.io)
- [Clang-tidy](https://clang.llvm.org)
- [Clang-format](https://clang.llvm.org)
- [cppcheck](http://cppcheck.sourceforge.net)

## Building the project

Add `Bincrafters` repository as a `Conan Remote` for loads of C++ packages

```bash
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
```

```bash
mkdir build
cd build
cmake ..
```

That's it! Simple and neat right?!

