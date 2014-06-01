# mvb

`mvb` is a little utility to move files back. It’s like `mv`, but reversed.

Have you ever moved the wrong file with `mv`, and edited your previous command
to mv back the file? With `mvb`, all you need to do is to re-run your command
with a `b` at the end of `mv`. That’s it.

    $ mv foo/bar/qux/myfile abc/xyz/myfile2

    # damn, wrong file, let’s move it back
    $ mvb foo/bar/qux/myfile abc/xyz/myfile2

## Features

* no dependencies
* all `mv` options are supported

## Install

    mkdir -p ~/bin
    curl https://raw.github.com/bfontaine/mvb/master/mvb > ~/bin/mvb
    chmod u+x ~/bin/mvb

This creates the `~/bin` directory if it doesn’t exist. If it’s not in your
`PATH` you have to add it:

    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

### Using Homebrew

On OS X with [Homebrew](http://brew.sh/), use:

    brew tap bfontaine/utils
    brew install mvb

## Caveats

A lot of `mv` variations can’t be reverted without much informations, for
example:

    mv foo/* bar/

Thus, `mvb` handles only simple cases where a file is renamed/moved, but not
complex ones involving glob patterns and directories renamming. By default,
`mvb` runs `mv` on its (switched) arguments. If the last path ends with a
slash, it appends the first file’s name to it before continuing.

For example, `mvb foo bar` is equivalent to `mv bar foo`, while `mvb foo bar/`
is equivalent to `mv bar/foo foo`.
