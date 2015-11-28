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

## Usage

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

## Interface

### Cursor control

### move_to(x, y)

Set the cursor absolute position where subsequent text will begin.

If no row/column parameters are provided, the cursor will move to the home position, at the upper left of the screen:

```ruby
cursor.move_to
```

### move(x, y)

Move cursor by x columns and y rows relative to its current position.

### up(count)

Move the cursor up by `count` rows; the default count is `1`.

### down(count)

Move the cursor down by `count` rows; the default count is `1`.

### forward(count)

Move the cursor forward by `count` columns; the default count is `1`.

### backward(count)

Move the cursor backward by COUNT columns; the default count is `1`.

### save

Save current cursor position.

### restore

Restore cursor position after a save cursor was called.

### current

Query current cursor position

### show

Show cursor

### hide

Hide cursor

### Clearing text

#### clear_line

Erase the entire current line.

#### clear_lines(count, direction)

Erase `count` rows in given direction; the default direction is `:up`.

```ruby
cursor.clear_lines(5, :down)
```

#### clear_screen_down

Erase the screen from the current line down to the bottom of the screen.

#### clear_screen_up

Erase the screen from the current line up to the top of the screen.

#### clear_screen

Erase the screen with the background colour and moves the cursor to home.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tty-cursor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
