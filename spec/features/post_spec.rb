RSpec.feature 'Post', type: :feature do
  let!(:post) { Post.create(title: 'test driven development 0', body: 'lorem lorem', state: 'draft') }

  scenario 'Listing all published post' do
    visit posts_path
    expect(page).not_to have_content(post.title)
  end

  feature 'Create a post' do
    scenario 'User create a valid a post' do
      visit new_post_path

      within('#new_post') do
        fill_in 'Title', with: 'test driven development 1'
        fill_in 'Body', with: 'Lorem Lorem'
        select('draft', from: 'State')
        click_button 'Create Post'
      end
      expect(page).to have_text('Post was successfully created')
    end

    scenario 'User create an invalid post' do
      visit new_post_path

      within('#new_post') do
        fill_in 'Title', with: 'test driven development 1'
        fill_in 'Body', with: 'Lorem Lorem'
        click_button 'Create Post'
      end
      expect(page).to have_text("can't be blank")
    end
  end

  feature 'Edit a post', js: true do
    published_post0 = Post.create(title: 'testing', body: 'lorem lorem', state: 'published')
    published_post1 = Post.create(title: 'testing', body: 'lorem lorem', state: 'published')

    before do
      visit posts_path
    end
    scenario 'Edit a valid post' do
      find("a[data-target='#myModalPost-#{published_post0.id}']").click
      within("#myModalPost-#{published_post0.id}") do
        fill_in 'Title', with: 'test driven development 1'
        fill_in 'Body', with: 'Lorem Lorem'
        select('draft', from: 'State')
        click_button 'Update Post'
      end
      sleep 1
      expect(page).to have_text('Post was successfully updated')
    end

    scenario 'Edit a valid post' do
      find("a[data-target='#myModalPost-#{published_post1.id}']").click
      within("#myModalPost-#{published_post1.id}") do
        fill_in 'Title', with: 'test driven development 1'
        fill_in 'Body', with: nil
        select('draft', from: 'State')
        click_button 'Update Post'
      end
      sleep 1
      expect(page).to have_text("Body can't be blank")
    end

  end
end
