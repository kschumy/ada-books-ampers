require "test_helper"

describe Book do
  describe 'relations' do

   it "had an author" do
     book = books(:poodr)
     book.author.must_equal authors(:metz)
   end

   it 'can set the author' do
     book = Book.new(title: "title books")
     book.author = authors(:metz)
     book.author_id.must_equal authors(:metz).id
   end
 end

 describe "first published" do
   it "should return the earliest published book for the author with multiple books" do
     book.author = Author.create name: "Kari B"
     value(book).must_be :valid?
   end

   it "must have as title" do
     book.author = Author.create name: "Kari B"
     book.title = nil
     book.valid?.must_equal false # must have a title
     book.errors.must_include :title
   end

   it "must have title between 1 and 25 characters" do
     book.author = Author.create name: "Kari B"
     book.title = ""
     book.valid?.must_equal false
     book.errors.must_include :title

     book.title = "a" * 26
     book.valid?.must_equal false
     book.errors.must_include :title
   end

   it "must have an author" do
     author = Author.create name: "Kari B"

     book.author = author
     book.author_id.must_equal author.id
   end

   it "must have a genre field" do
     book.genres.must_equal []
     book.genres << Genre.create(name: "Sci Fi")

     genre = Genre.find_by name: "Sci Fi"
     book.genres.must_include genre
   end

end


  # let(:book) { Book.new title: "Wizard of Oz"}
  # # Below can be done, but this is a little awkward and there is a better way
  # # let(:book) { Book.new title: "Wizard of Oz", author_id:
  # #   (Author.create name: "Kari B").id }
  #
  # it "must be valid" do
  #   book.author = Author.create name: "Kari B"
  #   value(book).must_be :valid?
  # end
  #
  # it "must have as title" do
  #   book.author = Author.create name: "Kari B"
  #   book.title = nil
  #   book.valid?.must_equal false # must have a title
  #   book.errors.must_include :title
  # end
  #
  # it "must have title between 1 and 25 characters" do
  #   book.author = Author.create name: "Kari B"
  #   book.title = ""
  #   book.valid?.must_equal false
  #   book.errors.must_include :title
  #
  #   book.title = "a" * 26
  #   book.valid?.must_equal false
  #   book.errors.must_include :title
  # end
  #
  # it "must have an author" do
  #   author = Author.create name: "Kari B"
  #
  #   book.author = author
  #   book.author_id.must_equal author.id
  # end
  #
  # it "must have a genre field" do
  #   book.genres.must_equal []
  #   book.genres << Genre.create(name: "Sci Fi")
  #
  #   genre = Genre.find_by name: "Sci Fi"
  #   book.genres.must_include genre
  # end
end
