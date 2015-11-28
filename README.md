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

### move(x, y)

Move cursor by x columns and y rows relative to its current position.

### up(count)

Move cursor up by a specific number of lines. Default is `1`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tty-cursor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
