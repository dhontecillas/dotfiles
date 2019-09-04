#!/usr/bin/env python3

import os
import sys


VIM_PLUGINS = (
    'git@github.com:rust-lang/rust.vim.git',
    'git@github.com:fatih/vim-go.git',
)

HOME = os.environ['HOME']

def install_vim_plugins():
    for vimplugin in VIM_PLUGINS:
        subdir = vimplugin[vimplugin.rfind('/') + 1: vimplugin.rfind('.')]
        fulldir = os.path.join(HOME, '.vim/pack/plugins/start', subdir)
        if not os.path.exists(fulldir):
            gitcmd = "mkdir -p {}; cd {}; git clone {}".format(
               fulldir, fulldir, vimplugin) 
            os.system(gitcmd)
        else:
            print('Already installed: {}'.format(subdir))

install_vim_plugins()
