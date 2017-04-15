# ipyvimIkj
A simple plugin that allows for one way communication from vim to a ipython instance in a tmux window.

## Setup

### Install this plugin using your favorite plugin manager

I personally use [vim-plug](https://github.com/junegunn/vim-plug)
```
Plug 'meain/ipyvim'
```

### Prepare the environment

Well I should have automated this but I am kinda lazy

#### So, what you have to do is:

Use tmux to open up a session named ipython. You can use the following command:
```sh
tmux new-session -s ipython
```

Now start ipython in the first window and first pane (the one you get when you create a new session)
Just type:
```sh
ipython
```

** And you are good to go. **

## Usage

I have set up some default bindings for `ipyvim`.

In normal mode you can use `<leader>i` to send the current line to ipython.  
In visual mode use `<leader>i` to send the visual selection to ipython

The functions used are (use it for remapping):
* `ExcecIpython` for normal mode
* `ExcecIpythonVisual` for visual mode


## TODO

* Indented code inside a block will not work as it is passed without un-indenting
