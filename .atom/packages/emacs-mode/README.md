Atom emacs-mode
======

This is an Emacs extension for Atom.

## Install

You can install it from `Atom -> Preferences -> Settings -> Packages`. To enable emacs-mode automatically on Atom starts, put following code to your init script:

```
atom.packages.enablePackage('emacs-mode').activateNow()
```

## Features

- Regular Emacs key binding(see below)
- Kill ring
- Buffer finder (C-x b), file finder(C-x C-f)
- Copy text by mouse selection
- Zen mode(hide tabs, sidebar)
- Marker
- Emacs-style cursor

## Keymap

```
'.editor':
  'ctrl-a': 'editor:move-to-first-character-of-line'
  'ctrl-e': 'editor:move-to-end-of-line'
  'ctrl-backspace': 'editor:backspace-to-beginning-of-word'
  'ctrl-j': 'editor:newline'
  'ctrl-o': 'emacs:open-line'
  'alt-f': 'emacs:forward-word'
  'alt-b': 'emacs:backward-word'
  'ctrl-l': 'emacs:recenter'
  'ctrl-space': 'emacs:set-mark'
  'ctrl-@': 'emacs: set-mark'
  'alt-;': 'editor:toggle-line-comments'

'.workspace':
  # cursor
  'ctrl-p': 'core:move-up'
  'ctrl-n': 'core:move-down'
  'ctrl-b': 'core:move-left'
  'ctrl-f': 'core:move-right'
  'alt-v': 'core:page-up'
  'ctrl-v': 'core:page-down'
  'alt->': 'core:move-to-bottom'
  'alt-<': 'core:move-to-top'

  # text manipulation
  'ctrl-w': 'emacs:kill-region'
  'ctrl-y': 'emacs:yank'
  'alt-y': 'emacs:yank-pop'
  'alt-w': 'emacs:kill-ring-save'
  'ctrl-/': 'core:undo'
  'ctrl-x ctrl-s': 'core:save'

  #selection
  'ctrl-x h': 'core:select-all'

  # buffer
  'ctrl-g': 'core:cancel'
  'ctrl-x ctrl-c': 'window:close'
  'ctrl-x k': 'core:close'
  'ctrl-x b': 'emacs:switch-buffer'
  'ctrl-x ctrl-f': 'emacs:find-file'
```

## Configuration
Below are the default configurations:

```
'emacs-mode':
  'hideTabs': false           # hide tabs
  'hideSidebar': false        # hide tree view 
  'useEmacsCursor': true      # use emacs style(fat) cursor
```
