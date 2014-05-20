#! /bin/bash

. assert.sh

# `mvb a b` should fail if 'b' doesn't exist
assert_raises "$MVB a b" 1

# `mvb a b` should rename 'b' into 'a'
touch b
assert_raises "$MVB a b" 0
assert_raises '[ -f a ]' 0
rm -rf a b

# `mvb a b/` should mv 'b/a' into 'a'
mkdir b
touch b/a
assert_raises "$MVB a b/" 0
assert_raises '[ -f a ]' 0
rm -rf a b

# `mvb a b c d/` should mv `d/X` into `X`, where X is a, b, and c
mkdir d
touch d/a
touch d/b
touch d/c
assert_raises "$MVB a b c d/" 0
assert_raises '[ -f a ]' 0
assert_raises '[ -f b ]' 0
assert_raises '[ -f c ]' 0
rm -rf a b c d

# `mvb a/b c d/` should mv d/b into a/b and d/c into c
mkdir a
mkdir d
touch d/b
touch d/c
assert_raises "$MVB a/b c d/" 0
assert_raises '[ -f a/b ]' 0
assert_raises '[ -f c ]' 0
rm -rf a b c d

assert_end 'mvb'
