require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test "should not save a note without name" do
  	note = Note.new
  	assert_not note.save, "Saved the note without a name"
  end

  test "should not save two notes with the same name" do
  	note1 = Note.new(:name => 'note1')
  	note2 = Note.new(:name => 'note1')
  	note1.save
  	assert_not note2.save, "Saved two notes with same name"
  end

  test "should create a randon note" do
  	new_note = Note.random_note
  	new_note.save

  	note = Note.last

  	assert_equal new_note, note, "new note not created"
  end

end
