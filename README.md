# mvb

`mvb` is a little utility to move files back.

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
