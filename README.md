# Steel

[![Pipeline](https://github.com/hyperspace-labs/steel/actions/workflows/pipeline.yml/badge.svg)](https://github.com/hyperspace-labs/steel/actions/workflows/pipeline.yml) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache_2.0-yellow.svg)](https://opensource.org/license/apache-2-0)

Steel is a set of libraries for the VHDL hardware description language that provides support for improved type names, type casting, and common functions. It is tested using the IEEE library implementations for the VHDL 2008 standard.

## Install

> __Note__: This project is published under the [Huron](https://github.com/hyperspace-labs/huron) channel.

Run the following Orbit command:
```
orbit install steel
```

Add the following line to your Orbit.toml:
``` toml
steel = "0.1"
```

## Usage

Add the following lines to your VHDL source file bring the set of libraries into scope:
``` vhdl
library stl;
context stl.prelude;
```
