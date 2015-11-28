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
      (x < 0 ? cursor_left(-x) : (x > 0 ? cursor_right(x) : '')) +
      (y < 0 ? cursor_down(-y) : (y > 0 ? cursor_up(y) : ''))
    end

    # Move cursor cursor_up by number of lines
    #
    # @param [Integer] count
    #
    # @api public
    def cursor_up(count = nil)
      ECMA_CSI + "#{(count || 1)}A"
    end

    # Move cursor down by number of lines
    #
    # @param [Integer] count
    #
    # @api public
    def cursor_down(count = nil)
      ECMA_CSI + "#{(count || 1)}B"
    end

    # Move to start of the line
    #
    # @api public
    def move_start
      cursor_left(1000)
    end

    # @param [Integer] count
    #   how far to go left
    # @api public
    def cursor_left(count = nil)
      ECMA_CSI + "#{count || 1}D"
    end

    # @api public
    def cursor_right(count = nil)
      ECMA_CSI + "#{count || 1}C"
    end

    # @api public
    def next_line
      ECMA_CSI + 'E'
    end

    # @api public
    def prev_line
      ECMA_CSI + 'F'
    end

    # Clear current line
    # @api public
    def clear_line
      move_start + ECMA_CSI + ECMA_CLR
    end

    # Clear a number of lines
    #
    # @param [Integer] amount
    #   the number of lines to clear
    # @param [Symbol] :direction
    #   the direction to clear, default :up
    #
    # @api public
    def clear_lines(amount, direction = :up)
      amount.times.reduce('') do |acc|
        dir = direction == :up ? cursor_up : cursor_down
        acc << dir + clear_line
      end
    end

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
  end # Cursor
end # TTY
