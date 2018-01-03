require "application_system_test_case"

class WeathersTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_path
    assert_selector 'h3', text: 'Current Weather'
    assert_button('Search')
    assert_field('city')
    assert_field('country')
  end

  test "search for weather with city that exists" do
    visit root_path
    fill_in 'city', with: 'New York'
    click_button 'Search'
    assert_selector 'h4', text: 'Weather in New York, US'
    assert_equal(6, all("table tr").count)
  end

  test "search for weather with city that exists in entered country" do
    visit root_path
    fill_in 'city', with: 'Munich'
    fill_in 'country', with: 'Germany'
    click_button 'Search'
    assert_selector 'h4', text: 'Weather in Munich, DE'
    assert_equal(6, all("table tr").count)
  end

  test "search for weather with city that does not exist" do
    visit root_path
    fill_in 'city', with: 'Fake City'
    click_button 'Search'
    assert_selector 'h4', text: 'City not found, please check.'
    refute_table
  end

  test "search for weather with city that exists but not in entered country" do
    visit root_path
    fill_in 'city', with: 'Berlin'
    fill_in 'country', with: 'France'
    click_button 'Search'
    assert_selector 'h4', text: 'City not found, please check.'
    refute_table
  end

end
