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

create_avatar  :username => 'notify', :campfire => 674538, :image_url => 'http://imgur.com/AsLqH.png', :important => true
create_avatar  :username => 'git', :campfire => 420683 , :image_url => 'http://a3.twimg.com/profile_images/72335082/2776359417_fa33869cd0_o_normal.png'
create_avatar  :username => 'adarowski', :campfire => 497207 , :image_url => 'http://a0.twimg.com/profile_images/1301875484/205645_10150236803629152_544839151_9236371_7431142_n_normal.jpeg'
create_avatar  :username => 'amynewell', :campfire => 718348 , :image_url => 'http://a3.twimg.com/profile_images/82352745/amy_by_ari_normal.jpg'
create_avatar  :username => 'mister20', :campfire => 319411 , :image_url => 'http://a1.twimg.com/profile_images/1376383275/user_18700-full_normal.jpg'
create_avatar  :username => 'panentheos', :campfire => 803905 , :image_url => 'http://tech.patientslikeme.com/wp-content/uploads/2011/02/brett.png'
create_avatar  :username => 'chrisbrewha', :campfire => 844722 , :image_url => 'http://tech.patientslikeme.com/wp-content/uploads/2011/03/brewer.jpg'
create_avatar  :username => 'fakecolinsnyder', :campfire => 723728 , :image_url => 'http://a1.twimg.com/profile_images/1241278064/Screen_shot_2011-02-11_at_10.39.47_AM_normal.png'
create_avatar  :username => 'knick44', :campfire => 97262 , :image_url => 'http://a1.twimg.com/profile_images/51448898/weemee_normal.JPG'
create_avatar  :username => 'dougMarttila', :campfire => 614691 , :image_url => 'http://a1.twimg.com/profile_images/1201054566/dougPhoto_2_normal.jpg'
create_avatar  :username => 'jdwyah', :campfire => 303846 , :image_url => 'http://a0.twimg.com/profile_images/52473016/profile2_normal.jpg'
create_avatar  :username => 'semanticart', :campfire => 628026 , :image_url => 'http://a3.twimg.com/profile_images/1359184711/Screen_shot_2011-05-16_at_9.15.04_PM_normal.png'
create_avatar  :username => 'joerodriguez', :campfire => 899927 , :image_url => 'http://a1.twimg.com/profile_images/75834218/n575683589_1343598_1804_normal.jpg'
create_avatar  :username => 'kbrigham', :campfire => 239739 , :image_url => 'http://a2.twimg.com/profile_images/52016632/KW_by_JDB_normal.jpg'
create_avatar  :username => 'kbrock', :campfire => 675940 , :image_url => 'http://a3.twimg.com/profile_images/1346535527/kb3_normal.jpg'
create_avatar  :username => 'hal678', :campfire => 695254 , :image_url => 'http://a1.twimg.com/profile_images/1111509567/mikowitz_normal.png'
create_avatar  :username => 'mo_faux', :campfire => 484642 , :image_url => 'http://a1.twimg.com/profile_images/1214250433/headshot2_normal.jpg'
create_avatar  :username => 'scottlistfield', :campfire => 259515 , :image_url => 'http://a1.twimg.com/profile_images/52369975/scott1_normal.jpg'
create_avatar  :username => 'shammond42', :campfire => 97261 , :image_url => 'http://a0.twimg.com/profile_images/1232628394/avatar-body-s_normal.png'
create_avatar  :username => 'thegreatape', :campfire => 926046 , :image_url => 'http://a3.twimg.com/profile_images/1366371084/IMG_2181_normal.jpg'
create_avatar  :username => 'wpeterson', :campfire => 611035, :image_url => 'http://a3.twimg.com/profile_images/1170560146/WinfieldPEI-face_normal.jpg'
create_avatar  :username => 'devittles ', :campfire => 877449, :image_url => 'http://a2.twimg.com/profile_images/66514222/devittles-avatar-7894_large_normal.png'
create_avatar  :username => 'letwittimate', :campfire => 877448, :image_url => 'http://a0.twimg.com/profile_images/1165521553/1_normal.jpg'

#Avatar.create :username => 'monkeyatlarge', :campfire => xxx, :image_url => 'http://a0.twimg.com/profile_images/55020500/jamesbuddyicon_normal.png'
#Avatar.create :username => 'jeff_cole', :campfire => xxx, :image_url => 'http://a0.twimg.com/profile_images/51990889/jeff_subway_normal.jpg'

create_component :display_name => 'Conference Call', :css_class => 'conference_control'
create_component :display_name => 'Guest Access', :css_class => 'guest_access_control'
create_component :display_name => 'Locking Control', :css_class => 'locking_control'
create_component :display_name => 'Latest 5 files', :css_class => 'files'
create_component :display_name => 'Launchbar', :css_class => 'launchbar'
create_component :display_name => 'Corner Logo', :css_class => 'corner_logo'
create_component :display_name => 'Narrow Screen', :css_class => 'narrow'

#Component.create :display_name => 'Growl Config', :css_class => 'growl_config_div'
