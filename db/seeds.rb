puts "######################## SEED DATA ########################"

puts "Adding 20 Sample Episodes..."
i = 0
50.times do
  Episode.create!(:title => "Episodi#{i.to_s}", :permalink => "episode-#{i.to_s}", :description => "Description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse leo purus, rutrum in ullamcorper eget, auctor a lacus. Quisque a facilisis est. Sed in blandit diam. Nam gravida, felis ac elementum elementum, eros metus consectetur ipsum, at eleifend quam erat nec ante. Aenean sit amet nulla eros, sit amet vehicula purus. Vivamus volutpat arcu a arcu sagittis aliquam. Donec hendrerit semper mauris, eget imperdiet enim posuere nec. Duis aliquet eleifend vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam purus justo, dapibus vel tempus quis, varius eu augue. Praesent ligula tortor, pellentesque nec vestibulum vitae, malesuada in lacus. Vestibulum fermentum enim quis magna posuere nec pretium arcu porttitor. Cras eu leo non sapien dapibus dapibus id vel nunc. Morbi eu placerat nulla.", :aired_on => Date.today, :notes => "Notes", :number => i)
  i += 1
end

puts "######################## END SEED DATA ########################"