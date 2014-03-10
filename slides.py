"""
1. Meta-Introduction

2. Introduction
    - ♀  (vi) χ  ♂ (Bram Moolenaar) →   Vi Improved
    - 7.4 released.

3. Basic Ideas
    - You have several robots waiting for commands
        - Normal mode
        - Insert mode
        - Visual mode
        - Ex mode
        - Operator pending mode
        - ...
    - Zen: You talk to your editor:
        - You tell it where to go: [count] {motion}
            - 4h, 12G, 50%, M
            - 4}, 9w
            - mark
        - You tell it what to do: verb + subject
            - d3j: delete three lines
            - y4l: yank 4 characters on the right side
            - p: paste
            - Insert mode - shell-like line editing: ^u, ^h, ^w, but not all: ^d
        - You tell it to store things: registers
            - "ay5j : yank 5 lines to register a for later use
            - "Ay4l : append 4 characters to register a
        - Make your commands shorter: map
            - nnoremap k :"ay5j<CR>
            - Avoid being busy for nothing till die: noremap →  no recursive mapping
            - map for different robots: inoremap, nnoremap, vnoremap ...
    - Basic configuration:
        - Major config file: $HOME/.vimrc OR $HOME/_vimrc on windows
        - Plugin directory: $HOME/.vim OR $HOME/_vim on windows

4. Handy Functions in Packet
    - Basic text handling:
        - search: /
        - substitute: :s/{pattern}/new-content/{falgs}
        - multi-copy: use registers
        - system clipboard: register * or +
        - be care about the tab settings when you are trying to paste

    - Auto-complete: omnifunc
        - Check your filetype: :set ft?<CR>
        - Check your omnifunc: :set omnifunc?<CR>
        - :h i_ctrl-x to see more
        - always keystroke ctrl-x_ctrl-o

    - Maro: advanced repeat method
        - capitalize the following words:
            - Record the macro: qavUWq Repeat it: 16@a
            - this is a text editor, there are many one like it, but this one is mine!
        - run a command in multiple window/buffer: windo, bufdo, argdo
        - also see g command

    - File diff: vimdiff
        - diffthis
        - diffsplit
        - diffpatch
        - diffget
        - diffput

5. Problems I've met:
    - Tab settings when copy from other process
    - When you accidentally modified a read-only file but needs to save it  
        :w !sudo tee %<CR>
    - 

5. It can be pretty COOL!
"""
