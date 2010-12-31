emails = %w(bernat@itnig.net jordi@jrom.net mutsuda@gmail.com david@loudthinking.com juanico@ramires.cat)
tags = %w(Rails Web Apple Database Javascript Microsoft Google)

emails.select {|e| e.match(/(bernat|jordi|mutsuda)/)}.each do |email|
  User.create! :email => email, :password => 'semantic', :password_confirmation => 'semantic'
end

puts "Adding 15 Sample Episodes..."
15.times do |i|
  e = Episode.create! :title => "Episodi #{i}",
                      :permalink => "episode-#{i}",
                      :description => "Description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse leo purus, rutrum in ullamcorper eget, auctor a lacus. Quisque a facilisis est. Sed in blandit diam. Nam gravida, felis ac elementum elementum, eros metus consectetur ipsum, at eleifend quam erat nec ante. Aenean sit amet nulla eros, sit amet vehicula purus. Vivamus volutpat arcu a arcu sagittis aliquam. Donec hendrerit semper mauris, eget imperdiet enim posuere nec. Duis aliquet eleifend vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam purus justo, dapibus vel tempus quis, varius eu augue. Praesent ligula tortor, pellentesque nec vestibulum vitae, malesuada in lacus. Vestibulum fermentum enim quis magna posuere nec pretium arcu porttitor. Cras eu leo non sapien dapibus dapibus id vel nunc. Morbi eu placerat nulla.",
                      :aired_on => Date.today - (15 - i).days,
                      :notes => "Notes",
                      :tag_names => tags.sample(rand(5)).join(' '),
                      :number => i

  rand(5).times do |ci|
    person = emails.sample
    c = e.comments.new :name => person.split('@').first.humanize, :email => person, :content => "Interesting..."
    c.save(false)
  end
end
