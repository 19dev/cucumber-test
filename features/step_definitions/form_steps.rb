# encoding: utf-8

Given /^I visit form page$/ do
  visit new_book_path
end

When /^I select "(.*?)" from "(.*?)" by "(.*?)"$/ do |arg1, arg2, arg3|

  puts "Liste(select):"
  puts <<-eos
    text: #{find_field('book_tur').text.inspect},
    value: #{find_field('book_tur').value.inspect},
  eos

  puts "Liste(select): options"
  options = find_field('book_tur').all('option')
  options.each do |option|
    puts "\toption-#{option.value} : #{option.text}"
  end

  page.select 'b', from: 'book_tur'
  puts "I select 'b' from liste"
end

Then /^"(.*?)" selected from "(.*?)"$/ do |arg1, arg2|
  # wrong: field_labeled('book_tur').element.search(".//option[@selected = 'selected']").inner_html.should =~ /a/
  # Yol 1: find_field('book_tur').value.should =~ 1
  # Yol 2: assert page.has_select? 'book_tur', selected: ['b']
  # Yol 3: page.should have_select 'book_tur', selected: ['a']

  puts "Listede 'b' mi seçildi?"
  page.should have_select 'book_tur', selected: ['b']
  puts "... bunda sorun beklemiyoruz."

  puts "Listede 'c' mi seçildi?"
  page.should have_select 'book_tur', selected: ['c']
  puts "... bunda hata üretmeli."

  ##
  #
  # Bonus:
  # Liste ilgili elemanlardan mı oluşuyor?
  #
  #   assert page.has_select? 'book_tur', options: ['a', 'v', 'b']
  #
  # Liste ilgili elemanları içeriyor mu?
  #
  #   buggy: assert page.has_select? 'book_tur', with_options: ['a', 'd']
  #
end

