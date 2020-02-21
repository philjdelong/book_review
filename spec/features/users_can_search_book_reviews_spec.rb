require 'rails_helper'

RSpec.describe "As a user" do
   describe "when i visit the home page" do
      describe "and enter a book title into the form" do
         it "i see all of the books info" do
            visit "/"

            fill_in :title, with: "the man who saw everything"
       
            click_on "Find Book"
            expect(current_path).to eq('/search')

            expect(page).to have_content("The Man Who Saw Everything")
            expect(page).to have_content("Deborah Levy")
           
            expect(page).to have_content("The Man Who Saw Everything,” which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at “authoritarian old men.")
            expect(page).to have_content("2019-10-09")
            
            expect(page).to have_content("Deborah Levy’s latest novel, “The Man Who Saw Everything,” experiments with time travel, history and the endless complications of love.")
            expect(page).to have_content("2019-10-15")
         end
      end
   end
end

# Then I should see the book's info
# For that book I should see
# - Title
# - Author
# - Genres
# (Note: genres is referred to as "subjects" in the book search response)
# I should also see:
# - This book has 2 reviews from the New York Times
#   (Note: reviews are the "summary" in the book review response)
# - Review 1: ""The Man Who Saw Everything,"" which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at "authoritarian old men.""
# Review Publication Date: 2019-10-09
# - Review 2: "Deborah Levy's latest novel, "The Man Who Saw Everything," experiments with time travel, history and the endless complications of love."
# Review Publication Date: 2019-10-15