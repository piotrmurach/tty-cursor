# encoding: utf-8

module TTY
  # Terminal cursor movement ANSI codes
  module Cursor
    module_function

    ECMA_CSI = "\e[".freeze
    DEC_RST  = 'l'.freeze
    DEC_SET  = 'h'.freeze
    DEC_TCEM = '?25'.freeze
    ECMA_CLR = 'K'.freeze

    # Make cursor visible
    # @api public
    def show
      ECMA_CSI + DEC_TCEM + DEC_SET
    end

    # Hide cursor
    # @api public
    def hide
      ECMA_CSI + DEC_TCEM + DEC_RST
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
      ECMA_CSI + 's'
    end

    # Restore cursor position
    # @api public
    def restore
      ECMA_CSI + 'u'
    end

    # Query cursor current position
    # @api public
    def current
      ECMA_CSI + '6n'
    end

    # Set the cursor absolute position
    # @param [Integer] row
    # @param [Integer] column
    # @api public
    def move_to(row = nil, column = nil)
      return ECMA_CSI + 'H' if row.nil? && column.nil?
      ECMA_CSI + "#{column + 1};#{row + 1}H"
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
      ECMA_CSI + "#{(count || 1)}A"
    end
    alias_method :cursor_up, :up

    # Move cursor down by number of lines
    #
    # @param [Integer] count
    #
    # @api public
    def down(count = nil)
      ECMA_CSI + "#{(count || 1)}B"
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
      ECMA_CSI + "#{count || 1}D"
    end
    alias_method :cursor_backward, :backward

    # @api public
    def forward(count = nil)
      ECMA_CSI + "#{count || 1}C"
    end
    alias_method :cursor_forward, :forward

    # @api public
    def next_line
      ECMA_CSI + 'E'
    end

    # @api public
    def prev_line
      ECMA_CSI + 'A' + ECMA_CSI + '1G'
    end

    # Erase n characters from the current cursor position
    # @api public
    def clear_char(n = nil)
      ECMA_CSI + "#{n}X"
    end

    # Erase the entire current line and return to beginning of the line
    # @api public
    def clear_line
      move_start + ECMA_CSI + ECMA_CLR
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
      ECMA_CSI + 'J'
    end

    # Clear screen up from current position
    # @api public
    def clear_screen_up
      ECMA_CSI + '1J'
    end

    # Clear the screen with the background colour and moves the cursor to home
    # @api public
    def clear_screen
      ECMA_CSI + '2J'
    end
  end # Cursor
end # TTY
