require 'test_helper'

class NotesTest < ActionDispatch::IntegrationTest

	test "should create a randomized note on access root page" do
		get "/"

		assert_redirected_to root_url.concat(Note.last.name), "seeing the root page"
	end

	test "should create note on access a non exist url" do
		get "/mynote"
		
		@note = Note.find_by_name("mynote")

		assert_not @note.blank?, "note mynote not created"

		assert_redirected_to root_url.concat(@note.name), "error creating a new note"

	end

	test "should load a note alright created on access an url" do
		post "/notenote", params: { name: "notenote", body: "note body" }
		
		get "/notenote"

		note = Note.find_by_name("notenote")

		assert_equal "note body", note.body
	end

	test "should ever redirect to root when a new note was created" do
    	assert_recognizes({:controller => 'notes', :action => 'new', :name =>"notetest"}, '/notetest')
  	end

  	test "should edit a note body" do
    	post "/notenote", params: { name: "notenote", body: "note body" }

    	note = Note.find_by_name("notenote")

    	patch "/notenote", params: {  body: "modified" }, xhr: true

    	note = Note.find_by_name("notenote")

    	assert_equal "modified", note.body

  	end

	test "updated route" do
  		assert_routing({ method: 'patch', path: '/notetest' }, { controller: "notes", action: "update", name: "notetest" })
  	end


end
