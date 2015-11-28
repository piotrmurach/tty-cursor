# encoding: utf-8

RSpec.describe TTY::Cursor do
  subject(:cursor) { described_class }

  it "shows cursor" do
    expect(cursor.show).to eq("\e[?25h")
  end

  it "hides cursor" do
    expect(cursor.hide).to eq("\e[?25l")
  end

  it "saves cursor position" do
    expect(cursor.save).to eq("\e[s")
  end

  it "restores cursor position" do
    expect(cursor.restore).to eq("\e[u")
  end

  it "moves up default by 1 line" do
    expect(cursor.up).to eq("\e[1A")
  end

  it "moves up by 5 lines" do
    expect(cursor.up(5)).to eq("\e[5A")
  end

  it "moves down default by 1 line" do
    expect(cursor.down).to eq("\e[1B")
  end

  it "moves down by 5 lines" do
    expect(cursor.down(5)).to eq("\e[5B")
  end

  it "moves to line start" do
    expect(cursor.move_start).to eq("\e[1000D")
  end

  it "moves left by 1 line default" do
    expect(cursor.left).to eq("\e[1D")
  end

  it "moves left by 5" do
    expect(cursor.left(5)).to eq("\e[5D")
  end

  it "moves right by 1 line default" do
    expect(cursor.right).to eq("\e[1C")
  end

  it "moves right by 5 lines" do
    expect(cursor.right(5)).to eq("\e[5C")
  end
end
