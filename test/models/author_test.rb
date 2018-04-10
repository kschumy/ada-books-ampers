require "test_helper"
require 'pry'

describe Author do

  describe "author" do
    it "had books" do
      test_metz = authors(:metz)
      test_metz.name.must_equal "Sandi Metz"
    end
  end


  # describe "first published" do
  #   let(:author) { Author.new }
  #   let(:book_a) { Book.create title: "foo", publication_year: "2000" }
  #   let(:book_b) { Book.create title: "bar", publication_year: "2001" }
  #   let(:book_c) { Book.create title: "baz", publication_year: nil }
  #
  #   it "must give the date of first publication" do
  #     author.books << book_a
  #     # binding.pry
  #     author.first_published.must_equal 2000
  #   end
  #
  #
  #   it "must give the date of first publication for multiple books" do
  #     author.books << book_a
  #     author.books << book_b
  #     author.first_published.must_equal 2000
  #   end
  #
  #
  #   it "must give the date of first publication for multiple books" do
  #     author.books << book_a
  #     author.books << book_b
  #     author.books << book_c
  #     author.first_published.must_equal 2000
  #   end
  #
  #   it "must give the date of first publication for multiple books" do
  #     author.books << book_c
  #     author.first_published.must_equal "NO BOOKS"
  #   end
  #
  # end

end
