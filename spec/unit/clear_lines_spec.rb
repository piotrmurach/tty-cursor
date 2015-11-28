# encoding: utf-8

RSpec.describe TTY::Cursor, '#clear_lines' do
  subject(:cursor) { described_class }

  it "clears line" do
    expect(cursor.clear_line).to eq("\e[1000D\e[K")
  end

  it "clears 5 lines up" do
    expect(cursor.clear_lines(5)).to eq([
      "\e[1A\e[1000D\e[K",
      "\e[1A\e[1000D\e[K",
      "\e[1A\e[1000D\e[K",
      "\e[1A\e[1000D\e[K",
      "\e[1A\e[1000D\e[K"
    ].join)
  end

  it "clears 5 lines down" do
    expect(cursor.clear_lines(5, :down)).to eq([
      "\e[1B\e[1000D\e[K",
      "\e[1B\e[1000D\e[K",
      "\e[1B\e[1000D\e[K",
      "\e[1B\e[1000D\e[K",
      "\e[1B\e[1000D\e[K"
    ].join)
  end

  it "clears screen down" do
    expect(cursor.clear_screen_down).to eq("\e[J")
  end

  it "clears screen up" do
    expect(cursor.clear_screen_up).to eq("\e[1J")
  end


  it "clears entire screen" do
    expect(cursor.clear_screen).to eq("\e[2J")
  end
end
