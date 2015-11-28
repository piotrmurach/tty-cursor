# TTY::Cursor
[![Gem Version](https://badge.fury.io/rb/tty-cursor.svg)][gem]
[![Build Status](https://secure.travis-ci.org/peter-murach/tty-cursor.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/peter-murach/tty-cursor/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/peter-murach/tty-cursor/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/peter-murach/tty-cursor.svg?branch=master)][inchpages]

[gem]: http://badge.fury.io/rb/tty-cursor
[travis]: http://travis-ci.org/peter-murach/tty-cursor
[codeclimate]: https://codeclimate.com/github/peter-murach/tty-cursor
[coverage]: https://coveralls.io/r/peter-murach/tty-cursor
[inchpages]: http://inch-ci.org/github/peter-murach/tty-cursor

> Terminal cursor movement and manipulation of cursor properties such as visibility.

The purpose of this library is to help move terminal cursor around using intuitive commands and help in clearing terminal screen.

**TTY::Cursor** provides independent cursor movement component for [TTY](https://github.com/peter-murach/tty) toolkit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-cursor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-cursor

## Contents

* [1. Usage](#1-usage)
* [2. Interface](#2-interface)
  * [2.1 Cursor control](#21-cursor-control)
    * [2.1.1 move_to(x, y)](#211-move_tox-y)
    * [2.1.2 move(x, y)](#212-movex-y)
    * [2.1.3 up(count)](#213-upcount)
    * [2.1.4 down(count)](#214-downcount)
    * [2.1.5 forward(count)](#215-forwardcount)
    * [2.1.6 backward(count)](#216-backwardcount)
    * [2.1.7 save](#217-save)
    * [2.1.8 restore](#218-restore)
    * [2.1.9 current](#219-current)
    * [2.1.10 next_line](#2110-next_line)
    * [2.1.11 prev_line](#2111-prev_line)
    * [2.1.12 show](#2112-show)
    * [2.1.13 hide](#2113-hide)
    * [2.1.14 invisible(stream)](#2114-invisiblestream)
  * [2.2 Clearing text](#22-clearing-text)
    * [2.2.1 clear_line](#221-clear_line)
    * [2.2.2 clear_lines(count, direction)](#222-clear_linescount-direction)
    * [2.2.3 clear_screen_down](#223-clear_screen_down)
    * [2.2.4 clear_screen_up](#224-clear_screen_up)
    * [2.2.5 clear_screen](#225-clear_screen)

## 1. Usage

**TTY::Cursor** is just a module hence you can reference it for later like so:

```ruby
cursor = TTY::Cursor
```

and then to move cursor 5 lines up and 2 rows to the right do:

```ruby
print cursor.up(5) + cursor.right(2)
```

or simple call `move` to move cursor relative to current position:

```ruby
print cursor.move(5, 2)
```

## 2. Interface

### 2.1 Cursor control

#### 2.1.1 move_to(x, y)

Set the cursor absolute position where subsequent text will begin.

If no row/column parameters are provided, the cursor will move to the home position, at the upper left of the screen:

```ruby
cursor.move_to
```

#### 2.1.2 move(x, y)

Move cursor by x columns and y rows relative to its current position.

#### 2.1.3 up(count)

Move the cursor up by `count` rows; the default count is `1`.

#### 2.1.4 down(count)

Move the cursor down by `count` rows; the default count is `1`.

#### 2.1.5 forward(count)

Move the cursor forward by `count` columns; the default count is `1`.

#### 2.1.6 backward(count)

Move the cursor backward by COUNT columns; the default count is `1`.

#### 2.1.7 save

Save current cursor position.

#### 2.1.8 restore

Restore cursor position after a save cursor was called.

#### 2.1.9 current

Query current cursor position

#### 2.1.10 next_line

Move the cursor to the next line.

#### 2.1.11 prev_line

Move the cursor to the previous line.

#### 2.1.12 show

Show cursor

#### 2.1.13 hide

Hide cursor

#### 2.1.14 invisible(stream)

To hide cursor for the duration of the block do:

```ruby
cursor.invisible { ... }
```

By default standard output will be used but you can change that by passing a different stream that responds to `print` call:

```ruby
cursor.invisible($stderr) { .... }
```

### 2.2 Clearing text

#### 2.2.1 clear_line

Erase the entire current line.

#### 2.2.2 clear_lines(count, direction)

Erase `count` rows in given direction; the default direction is `:up`.

```ruby
cursor.clear_lines(5, :down)
```

#### 2.2.3 clear_screen_down

Erase the screen from the current line down to the bottom of the screen.

#### 2.2.4 clear_screen_up

Erase the screen from the current line up to the top of the screen.

#### 2.2.5 clear_screen

Erase the screen with the background colour and moves the cursor to home.

## Contributing

1. Fork it ( https://github.com/peter-murach/tty-cursor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
