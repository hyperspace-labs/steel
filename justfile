# Compile all source files
compile:
    orbit test --target ghdl --all -- --run com

# Run simulations
test:
    orbit test --keep --target ghdl --tb types_tb
    orbit test --keep --target ghdl --tb math_tb
    orbit test --keep --target ghdl --tb manip_tb
    orbit test --keep --target ghdl --tb dims_tb
    orbit test --keep --target ghdl --tb cast_tb
