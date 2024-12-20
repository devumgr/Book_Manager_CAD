require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @user = users(:emily) # Reference the fixture for Emily
    @book = @user.books.build(title: "Book Title", 
    author: "Book Author", 
    genre: "Book Genre", 
    status: "Book Status", 
    user_id: @user.id)
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "user id should be present" do
    @book.user_id = nil
    assert_not @book.valid?
  end

  test " order shound be most recent first" do
    assert_equal book(:most_recent), Book.first
  end

  test "post should be destroyed" do
    @user.save
    @user.book.create!()
    assert_difference 'Book.count', -1 do
      @user.destroy
    end
  end
end

