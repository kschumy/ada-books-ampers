require "test_helper"

describe AuthorsController do
  describe "basic" do
  it "should get index" do
    get authors_path
    must_respond_with :success
  end

  it "should get show" do
    get author_path(authors(:metz).id)
    must_respond_with :success
  end

  it "should get edit" do
    # get authors_edit_url
    # value(response).must_be :success?
  end

  it "should successfully get to an edit page for an author that exists" do
    get edit_author_path(authors(:metz).id)
    must_respond_with :success
  end

  it "should redirect to the home page when going to the edit page an author
    that does not exist" do
    get edit_author_path('foo')
    must_respond_with :redirect
    must_redirect_to root_path
  end

  it "should get new" do
    # get authors_new_url
    # value(response).must_be :success?
  end

  it "should get create" do
    # get authors_create_url
    # value(response).must_be :success?
  end

  it "should get destroy" do
    # get authors_destroy_url
    # value(response).must_be :success?
  end

  end

  describe "create" do
    it "successfully creates an author with valid data" do
      proc {
        post authors_path, params: { author: { name: "New Author" } }
      }.must_change 'Author.count', 1

      must_respond_with :redirect
      must_redirect_to authors_path
    end
  end

  describe "update" do
    it "updates an Author's name when given a valid name and valid author" do
      updated_name = "deeface"
      put author_path(authors(:metz).id), params: { author: { name: updated_name } }
      updated_author = Author.find(authors(:metz).id)

      updated_author.name.must_equal updated_name
      must_respond_with :redirect
    end
  end

end
