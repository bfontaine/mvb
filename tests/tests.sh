#! /bin/bash

. assert.sh

# `mvb a b` should fail if 'b' doesn't exist
assert_raises 'mvb a b' 1

# `mvb a b` should rename 'b' to 'a'
touch b
assert_raises 'mvb a b' 0
assert_raises '[ -f a ]' 0
rm a

# `mvb a b/` should mv 'b/a' in 'a'
mkdir b
touch b/a
assert_raises 'mvb a b/' 0
assert_raises '[ -f a ]' 0
rm a
rmdir b

assert_end 'mvb'
