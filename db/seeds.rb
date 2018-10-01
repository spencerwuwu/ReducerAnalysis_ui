# coding: utf-8

DatabaseCleaner.clean_with(:truncation)

Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each { |f| load(f) }
