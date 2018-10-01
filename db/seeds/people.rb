Person.create(:name => "Yu-Fang Chen", :url => "http://www.iis.sinica.edu.tw/~yfc/doku.php", :email => "yfc@iis.sinica.edu.tw", :img_name => "Yu-Fang-Chen.jpg", :description => "", :is_contact => false)
Person.create(:name => "Wei-Cheng Wu", :url => "https://github.com/spencerwuwu", :email => "spencerwu85@gmail.com", :img_name => "Wei-Cheng-Wu.jpg", :description => "", :is_contact => true)
Person.create(:name => "-------", :url => "", :email => "", :img_name => "image.png", :description => "", :is_contact => false)

puts "People seed complete"
