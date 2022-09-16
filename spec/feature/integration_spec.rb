# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid title' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J K Rowling'
    fill_in 'Price', with: '8.99'
    fill_in 'Date', with: '2022-09-24'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'valid author' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter: Book 2'
    fill_in 'Author', with: 'J K Rowling'
    fill_in 'Price', with: '9.99'
    fill_in 'Date', with: '2022-09-24'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('J K Rowling')
  end

  scenario 'valid price' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter: Book 3'
    fill_in 'Author', with: 'J K Rowling'
    fill_in 'Price', with: '10.99'
    fill_in 'Date', with: '2022-09-24'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('10.99')
  end

  scenario 'valid date' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter: Book 4'
    fill_in 'Author', with: 'J K Rowling'
    fill_in 'Price', with: '10.99'
    fill_in 'Date', with: '2022-10-26'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('2022-10-26')
  end
end