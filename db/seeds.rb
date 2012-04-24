#important = bold the person

def create_unique(model,key,options)
  unless model.send("find_by_#{key}",options[key])
    model.create options
  end
end

def create_avatar(options)
  create_unique(Avatar,:username,options)
end

def create_component(options)
  create_unique(Component,:css_class, options)
end

Avatar.quick 'notify', :campfire => 674538, 'http://imgur.com/AsLqH.png', :important => true
Avatar.quick 'git', :campfire => 420683
Avatar.quick 'adarowski', :campfire => 497207
Avatar.quick 'amynewell', :campfire => 718348
Avatar.quick 'mister20', :campfire => 319411
Avatar.quick 'panentheos', :campfire => 803905
Avatar.quick 'chrisbrewha', :campfire => 844722 
Avatar.quick 'fakecolinsnyder', :campfire => 723728
Avatar.quick 'knick44', :campfire => 97262
Avatar.quick 'dougMarttila', :campfire => 614691
Avatar.quick 'jdwyah', :campfire => 303846
Avatar.quick 'semanticart', :campfire => 628026
Avatar.quick 'joerodriguez', :campfire => 899927
Avatar.quick 'kbrigham', :campfire => 239739
Avatar.quick 'kbrock', :campfire => 675940
Avatar.quick 'hal678', :campfire => 695254
Avatar.quick 'mo_faux', :campfire => 484642
Avatar.quick 'scottlistfield', :campfire => 259515
Avatar.quick 'shammond42', :campfire => 97261
Avatar.quick 'thegreatape', :campfire => 926046
Avatar.quick 'wpeterson', :campfire => 611035
Avatar.quick 'devittles ', :campfire => 877449
Avatar.quick 'letwittimate', :campfire => 877448
Avatar.quick 'paulwicks', :campfire => 300257
Avatar.quick 'nikirikou', :campfire => 1033616
Avatar.quick 'jeff_cole', :campfire => 91734
Avatar.quick 'shivzb', :campfire => 1071088
Avatar.quick 'br1anb0yle', 1146518
Avatar.where("username like '%shi%'").first.update_attributes(:campfire => "1071088")
#Avatar.create :username => 'monkeyatlarge', :campfire => xxx, :image_url => 'http://a0.twimg.com/profile_images/55020500/jamesbuddyicon_normal.png'
Avatar.quick 'shivzb', 455538515

create_component :display_name => 'Conference Call', :css_class => 'conference_control'
create_component :display_name => 'Guest Access', :css_class => 'guest_access_control'
create_component :display_name => 'Locking Control', :css_class => 'locking_control'
create_component :display_name => 'Latest 5 files', :css_class => 'files'
create_component :display_name => 'Launchbar', :css_class => 'launchbar'
create_component :display_name => 'Corner Logo', :css_class => 'corner_logo'
create_component :display_name => 'Narrow Screen', :css_class => 'narrow'

#Component.create :display_name => 'Growl Config', :css_class => 'growl_config_div'
