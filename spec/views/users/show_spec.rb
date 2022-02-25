require 'rails_helper'

RSpec.describe 'Users show', type: :feature do
  scenario 'Check the existence of the current user username, photo, user 3 posts, bio, see all posts button and, links functionality' do
    user1 = User.create(name: 'Tom', email: 'tom@abc.com', password: 'aaaaaa', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsm56ieYOuTZe84DQ0mG-uTe4YIXtsyJITsg&usqp=CAU', bio: 'Teacher from Mexico')
    visit '/users/sign_in'
    fill_in 'user_email', :with => 'tom@abc.com'
    fill_in 'user_password', :with => 'aaaaaa'
    # fill_in 'user_password_confirmation', :with => 'aaaaaa'
    find('input[name="commit"]').click
    puts user1.id
    post1 = Post.create(author_id: user1.id, title: 'First post', text: 'This is the first post')
    post2 = Post.create(author_id: user1.id, title: 'Second post', text: 'This is the second post')
    post3 = Post.create(author_id: user1.id, title: 'Third post', text: 'This is the third post')

    visit "/users/#{user1.id}"
    expect(page).to have_content('Tom')
    expect(page).to have_content('Teacher from Mexico')
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsm56ieYOuTZe84DQ0mG-uTe4YIXtsyJITsg&usqp=CAU']")

    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
    expect(page).to have_content('Third post')
    expect(page).to have_content('See all posts')
    page.find('button', text: "See all posts").click
    expect(current_path).to eq "/users/#{user1.id}/posts"
  

  end
end 