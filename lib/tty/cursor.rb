# encoding: utf-8

module TTY
  # Terminal cursor movement ANSI codes
  module Cursor
    module_function

    ESC = "\e".freeze
    CSI = "\e[".freeze
    DEC_RST  = 'l'.freeze
    DEC_SET  = 'h'.freeze
    DEC_TCEM = '?25'.freeze

    # Make cursor visible
    # @api public
    def show
      CSI + DEC_TCEM + DEC_SET
    end

    # Hide cursor
    # @api public
    def hide
      CSI + DEC_TCEM + DEC_RST
    end

    # Switch off cursor for the block
    # @api public
    def invisible(stream = $stdout)
      stream.print(hide)
      yield
    ensure
      stream.print(show)
    end

    # Save current position
    # @api public
    def save
      CSI + 's'
    end

    # Restore cursor position
    # @api public
    def restore
      CSI + 'u'
    end

    # Query cursor current position
    # @api public
    def current
      CSI + '6n'
    end

    # Set the cursor absolute position
    # @param [Integer] row
    # @param [Integer] column
    # @api public
    def move_to(row = nil, column = nil)
      return CSI + 'H' if row.nil? && column.nil?
      CSI + "#{column + 1};#{row + 1}H"
    end

    # Move cursor relative to its current position
    #
    # @param [Integer] x
    # @param [Integer] y
    #
    # @api public
    def move(x, y)
      (x < 0 ? backward(-x) : (x > 0 ? forward(x) : '')) +
      (y < 0 ? down(-y) : (y > 0 ? up(y) : ''))
    end

    # Move cursor up by number of lines
    #
    # @param [Integer] count
    #
    # @api public
    def up(count = nil)
      CSI + "#{(count || 1)}A"
    end
    alias_method :cursor_up, :up

    # Move cursor down by number of lines
    #
    # @param [Integer] count
    #
    # @api public
    def down(count = nil)
      CSI + "#{(count || 1)}B"
    end
    alias_method :cursor_down, :down

    # Move to start of the line
    #
    # @api public
    def move_start
      backward(1000)
    end

    # @param [Integer] count
    #   how far to go left
    # @api public
    def backward(count = nil)
      CSI + "#{count || 1}D"
    end
    alias_method :cursor_backward, :backward

    # @api public
    def forward(count = nil)
      CSI + "#{count || 1}C"
    end
    alias_method :cursor_forward, :forward

    # @api public
    def next_line
      CSI + 'E'
    end

    # @api public
    def prev_line
      CSI + 'A' + CSI + '1G'
    end

    # Erase n characters from the current cursor position
    # @api public
    def clear_char(n = nil)
      CSI + "#{n}X"
    end

    # Erase the entire current line and return to beginning of the line
    # @api public
    def clear_line
      move_start + CSI + '2K'
    end

    # Erase from the beginning of the line up to and including
    # the current cursor position.
    # @api public
    def clear_line_before
      CSI + '0K'
    end

    # Erase from the current position (inclusive) to
    # the end of the line
    # @api public
    def clear_line_after
      CSI + '1K'
    end

    # Clear a number of lines
    #
    # @param [Integer] count
    #   the number of lines to clear
    # @param [Symbol] :direction
    #   the direction to clear, default :up
    #
    # @api public
    def clear_lines(count, direction = :up)
      count.times.reduce('') do |acc, i|
        dir = direction == :up ? up : down
        acc << clear_line + ((i == count - 1) ? '' : dir)
      end
    end
    alias_method :clear_rows, :clear_lines

    # Clear screen down from current position
    # @api public
    def clear_screen_down
      CSI + 'J'
    end

    # Clear screen up from current position
    # @api public
    def clear_screen_up
      CSI + '1J'
    end

    # Clear the screen with the background colour and moves the cursor to home
    # @api public
    def clear_screen
      CSI + '2J'
    end
  end # Cursor
end # TTY
