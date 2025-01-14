#!/bin/bash

# Lint
clang-format -i main.c
clang-format -i projects/marbles/marbles.c

# Cleanup
rm -f ./oscean
rm -f ./marbles
rm -rf ../site
mkdir ../site

# Projects
cc projects/marbles/marbles.c -std=c89 -Os -DNDEBUG -g0 -s -Wall -Wno-unknown-pragmas -o marbles

# Linux(debug)
cc -std=c89 -DDEBUG -Wall -Wno-unknown-pragmas -Wpedantic -Wshadow -Wuninitialized -Wextra -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=int-conversion -Wvla -g -Og -fsanitize=address -fsanitize=undefined main.c -o oscean

# Linux(fast)
# cc main.c -std=c89 -Os -DNDEBUG -g0 -s -Wall -Wno-unknown-pragmas -o oscean

# RPi
# tcc -Wall main.c -o oscean

# Plan9
# pcc main.c -o oscean

# Valgrind
# gcc -std=c89 -DDEBUG -Wall -Wpedantic -Wshadow -Wuninitialized -Wextra -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=int-conversion -Wvla -g -Og main.c -o oscean
# valgrind ./oscean

# Build Size
# echo "$(du -b ./oscean | cut -f1) bytes written"

# Run
./marbles inc/html/death.htm
./oscean

# Cleanup
rm -f ./oscean
rm -f ./marbles
