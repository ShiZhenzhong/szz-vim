"""
1. Meta-Introduction
    - Why we are here and 
    - What we are going to talk about

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
        - colorful: colorscheme
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

    - Comunicate with outside world
        - :r !ps aux
        - netrw

5. Problems I've met:
    - Tab settings when copy from other process
    - When you accidentally modified a read-only file but needs to save it
        :w !sudo tee %<CR>
    - keystroke conflicts with other tools like GNU screen or tmux

6. IT CAN BE PRETTY COOL!
    - Plugins intro:
        - General plugin, filetype plugin, event driven, docoments...
        - Plugin management:
            - Tranditional: $HOME/.vim/plugin, $HOME/.vim/ftplugin, $HOME/.vim/doc
            - pathogen: keep plugins seperated
            - vundle: repo-based plugin management tool
        - Where to find plugins:
            - Official site: www.vim.org
            - Github.com

    - What we need for IDE:
        - File browsing:
            - nerdtree, bufexplorer
        - Syntax highlight:
            - vim-colors-solarized, vim-javascript-syntax, javascript-libraries-syntax.vim, vim-css-color
        - Syntax check:
            - syntastic, jshint2.vim, flake8, pep8
        - Fuzzy search by file names or by different type:
            - ctrlP
        - Moving fast:
            - vim-easymotion, ctags
        - Coding fast:
            - nerdcommenter, vim-surround, vim-repeat, auto-pairs
        - Auto-complete:
            - vim-snipmate, tern_for_vim, jedi-vim, emmet-vim, neocomplete, YouCompleteMe
        - VCM integerated:
            - fugitive
        - Visual change history:
            - gundo.vim

    - Funny things
        - rot13

7. How to write a great software?
    - Extension - plug-in and plug-out easily
    - Configuration - Configure in the programming way
    - Customization - Do not be too/blindly confident
    - Enough handy documents - Do not make people confused
    - Be open, do more sharing :)

"""
