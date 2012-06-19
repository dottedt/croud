
require 'csv'

      # Drop, create and migrate the database just to be sure we don't add data to an already populated database
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      
#__________________________________________      

      # Create Courses
      # DEVMWF = id 1
      Course.create(
                    name: 'Web Development',
                    start_date: "2012-04-09",
                    end_date: "2012-06-19",
                    monday: 1,
                    tuesday: 0,
                    wednesday: 1,
                    thursday: 0,
                    friday: 1,
                    saturday: 0,
                    sunday: 0
                    )
     # DEVTTH = id 2             
      Course.create(
                    name: 'Web Development',
                    start_date: "2012-04-10",
                    end_date: "2012-06-19",
                    monday: 0,
                    tuesday: 1,
                    wednesday: 0,
                    thursday: 1,
                    friday: 0,
                    saturday: 0,
                    sunday: 0
                    )
      # HTML = id 3            
      Course.create(
                    name: 'HTML & CSS',
                    start_date: "2012-04-16",
                    end_date: "2012-06-19",
                    monday: 1,
                    tuesday: 0,
                    wednesday: 0,
                    thursday: 0,
                    friday: 0,
                    saturday: 0,
                    sunday: 0
                    )
      # UX = id 4
      Course.create(
                    name: 'User Experience',
                    start_date: "2012-04-17",
                    end_date: "2012-06-19",
                    monday: 0,
                    tuesday: 1,
                    wednesday: 0,
                    thursday: 0,
                    friday: 0,
                    saturday: 0,
                    sunday: 0
                    )
                    
#__________________________________________  
  
      # Create Teams
      # Current Crowd = id 1
      Team.create(
                    name: 'Current Crowd',
                    description: 'A lightweight, visual directory for any group.',
                    url: 'cademo.currentcrowd.com'
                    )
      # WarRoom = id 2
      Team.create(
                    name: 'WarRoom',
                    description: 'WarRoom is the easiest way for lawyers to manage facts and evidence.',
                    url: 'warroomlaw.com'
                    )
      # Voluntr.me = id 3
      Team.create(
                    name: 'Voluntr.me',
                    description: "Voluntr.me is a volunteer recommendation engine which utilizes users existing social network."
                    )
      # PoliLobby = id 4
      Team.create(
                    name: 'PoliLobby'
                    )
      # LeaseMaid = id 5
      Team.create(
                    name: 'LeaseMaid',
                    description: "We handle the chores of closing new tenants." 
                    )
      # BeerOn = id 6
      Team.create(
                    name: 'BeerOn',
                    description: "BeerOn will recommend you a beer based on which bar you're at and what kind of beer you're in the mood for.",
                    url: 'beeron.herokuapp.com'
                    )
      # StreamPass = id 7
      Team.create(
                    name: 'StreamPass',
                    description: "A Ticketing Platform For Live-Streamed Events."
                    )
      # justbuckit.us = id 8
      Team.create(
                    name: 'justbuckit.us',
                    description: "justbuckit.us is your social bucket list. Share whatever you want and just buck it.",
                    url: "http://www.justbuckit.us"
                    )
      # OnceIMet = id 9
      Team.create(
                    name: 'OnceIMet',
                    description: "OnceIMet is a powerful new tool that allows you to keep track of your friends, colleagues, acquaintances and anyone else you may want to keep tabs on.",
                    url: 'http://onceimet.com '
                    )
      # Tattu = id 10
      Team.create(
                    name: 'Tattu'
                    )

      # PriceIntel = id 11
      Team.create(
                    name: 'PriceIntel'
                    )
      # Librarius = id 12
      Team.create(
                    name: 'Librarius',
                    description: 'The book club management tool that intends to make reading cool again.',
                    url: 'www.librarius.co'
                    )
      # LanguagePal = id 13
      Team.create(
                    name: 'LanguagePal',
                    description: "Skip the phrasebooks and meet someone foreign."
                    )
      # Taughtby = id 14
      Team.create(
                    name: 'Taughtby'
                    )
      # Sinisereo = id 15
      Team.create(
                    name: 'Sinistereo',
                    description: "Pandora for new bands and new music."
                    )
      # Brave = id 16
      Team.create(
                    name: 'Brave'
                    )
      # travel720 = id 17
      Team.create(
                    name: 'travel720'
                    )
      # eLegacy = id 18
      Team.create(
                    name: 'eLegacy',
                    description: "A web-based application that allow people to easily preserve and share their legacies with loved ones."
                    )
      # Kanguru = id 19
      Team.create(
                    name: 'Kanguru',
                    description: "Take this bring that. Kanguru recommends the best mode of transportation and what to bring on your daily commute to face the elements.",
                    url: 'kanguruapp.com'
                    )
      #__________________________________________      
      
      # Create Groups
      # Student = id 1
      Group.create(name: 'Student')  
      # Alumni = id 2
      Group.create(name: 'Alumni')  
      # Mentor = id 3
      Group.create(name: 'Mentor')  
      # Staff = id 4
      Group.create(name: 'Staff')  
      # Instructor = id 5
      Group.create(name: 'Instructor')  
      # Teaching Assistant = id 6
      Group.create(name: 'Teaching Assistant')  
      # Sprint Manager = id 7
      Group.create(name: 'Sprint Manager')  
      # Visitor = id 8
      Group.create(name: 'Visitor')  

#__________________________________________  


        # Open the CSV file and operates on each row with the options telling it that the separator is a comma, do not use the first row
        # because they are headers, and convert the header to a symbol so that it will match the table columns



        CSV.foreach("#{Rails.root}/db/people.csv", {:col_sep => ',',encoding: "UTF-8"} ) do |row|
                  
                 
                  User.create(
                        :first_name => row[0],
                        :last_name => row[1],
                        :hometown => row[12],
                        :quote => row[13],
                        :quote_author => row[14],
                        :email => row[15],
                        :phone => row[16],
                        :demo_day_team => row[17],
                        :twitter => row[18],
                        :github => row[19],
                        :facebook => row[20],
                        :linkedin => row[21],
                        :user_image => row[22],
                        :fav_book => row[23],
                        :why_ca => row[24],
                        :culture => row[25],
                        :app_idea => row[26],
                        :quarter => row[27],
                        :mentor_assigned => row[28],
                        :video => row[33],
                        :learned => row[34],
                        :built => row[35],
                        :what_next => row[36],
                        :before_ca => row[37]

                        )
                        puts row[22]



                  # Create Course assignments
                  # Dev MWF
                  if row[4] == "1"
                     Assignment.create!(
                        user_id: User.last.id,
                        group_id: 1,
                        course_id: 1
                        )
                  end
                
                # Dev TTH 
                  if row[3] == "1"
                     Assignment.create!(
                        user_id: User.last.id,
                        group_id: 1,
                        course_id: 2
                        )
                
                  end
                  
                  #html and css
                  if row[5] == "1" 
                     Assignment.create!(
                        user_id: User.last.id,
                        group_id: 1,
                        course_id: 3
                        )
                  end
                  
                  #UX
                  if row[6] == "1"
                     Assignment.create!(
                        user_id: User.last.id,
                        group_id: 1,
                        course_id: 4
                        )
                  end
                
                
                
                  # Create Group assignments
                  #Alumni
                  if row[7] == "1"
                        Assignment.create!(
                        user_id: User.last.id,
                        group_id: 2
                              )
                  end
                  
                  if row[8] == "1"
                        Assignment.create!(
                        user_id: User.last.id,
                        group_id: 3
                              )
                  end
                  
                  if row[9] == "1"
                        Assignment.create!(
                        user_id: User.last.id,
                        group_id: 4
                              )
                  end
                  
                  if row[10] == "1"
                        Assignment.create!(
                        user_id: User.last.id,
                        group_id: 5   
                              )
                  end
                  if row[11] == "1"
                        Assignment.create!(
                        user_id: User.last.id,
                        group_id: 6
                              )
                  end



      
        # Create Student Team assignments
               if row[17] == "travel720" or row[30] == "travel720"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 17,
                     group_id: 1
                           )
               end
               if row[17] == "Sinistereo" or row[30] == "Sinistereo"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 15,
                     group_id: 1
                           )
               end
               if row[17] == "PriceIntel" or row[30] == "PriceIntel"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 11,
                     group_id: 1
                           )
               end
               if row[17] == "eLegacy" or row[30] == "eLegacy"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 18,
                     group_id: 1
                           )
               end
               if row[17] == "OnceIMet" or row[30] == "OnceIMet"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 9,
                     group_id: 1
                           )
               end
               if row[17] == "LeaseMaid" or row[30] == "LeaseMaid"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 5,
                     group_id: 1
                           )
               end
               if row[17] == "PoliLobby" or row[30] == "PoliLobby"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 4,
                     group_id: 1
                           )
               end
               if row[17] == "justbuckit.us" or row[30] == "justbuckit.us"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 8,
                     group_id: 1
                           )
               end
               if row[17] == "WarRoom" or row[30] == "WarRoom"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 2,
                     group_id: 1
                           )
               end
               if row[17] == "Language Pal" or row[30] == "Language Pal"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 13,
                     group_id: 1
                           )
               end
               if row[17] == "StreamPass" or row[30] == "StreamPass"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 7,
                     group_id: 1
                           )
               end
               if row[17] == "TaughtBy" or row[30] == "TaughtBy"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 14,
                     group_id: 1
                           )
               end
               if row[17] == "Librarius" or row[30] == "Librarius"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 12,
                     group_id: 1
                           )
               end
               if row[17] == "Kanguru" or row[30] == "Kanguru"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 19,
                     group_id: 1
                           )
               end
               if row[17] == "Brave" or row[30] == "Brave"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 16,
                     group_id: 1
                           )
               end
               if row[17] == "Current Crowd" or row[30] == "Current Crowd"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 1,
                     group_id: 1
                           )
               end
               if row[17] == "BeerOn" or row[30] == "BeerOn"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 6,
                     group_id: 1
                           )
               end
               if row[17] == "Voluntr.me" or row[30] == "Voluntr.me"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 3,
                     group_id: 1
                           )
               end
               
               if row[17] == "Tattu" or row[30] == "Tattu"
                     Assignment.create!(
                     user_id: User.last.id,
                     team_id: 10,
                     group_id: 1
                           )
               end
               
         # Create Sprint Manager Team assignments
                if row[32] == "travel720" or row[31] == "travel720"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 17,
                      group_id: 7
                            )
                end
                if row[32] == "Sinistereo" or row[31] == "Sinistereo"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 15,
                      group_id: 7
                            )
                end
                if row[32] == "PriceIntel" or row[31] == "PriceIntel"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 11,
                      group_id: 7
                            )
                end
                if row[32] == "eLegacy" or row[31] == "eLegacy"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 18,
                      group_id: 7
                            )
                end
                if row[32] == "OnceIMet" or row[31] == "OnceIMet"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 9,
                      group_id: 7
                            )
                end
                if row[32] == "LeaseMaid" or row[31] == "LeaseMaid"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 5,
                      group_id: 7
                            )
                end
                if row[32] == "PoliLobby" or row[31] == "PoliLobby"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 4,
                      group_id: 7
                            )
                end
                if row[32] == "justbuckit.us" or row[31] == "justbuckit.us"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 8,
                      group_id: 7
                            )
                end
                if row[32] == "WarRoom" or row[31] == "WarRoom"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 2,
                      group_id: 7
                            )
                end
                if row[32] == "Language Pal" or row[31] == "Language Pal"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 13,
                      group_id: 7
                            )
                end
                if row[32] == "StreamPass" or row[31] == "StreamPass"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 7,
                      group_id: 7
                            )
                end
                if row[32] == "TaughtBy" or row[31] == "TaughtBy"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 14,
                      group_id: 7
                            )
                end
                if row[32] == "Librarius" or row[31] == "Librarius"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 12,
                      group_id: 7
                            )
                end
                if row[32] == "Kanguru" or row[31] == "Kanguru"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 19,
                      group_id: 7
                            )
                end
                if row[32] == "Brave" or row[31] == "Brave"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 16,
                      group_id: 7
                            )
                end
                if row[32] == "Current Crowd" or row[31] == "Current Crowd"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 1,
                      group_id: 7
                            )
                end
                if row[32] == "BeerOn" or row[31] == "BeerOn"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 6,
                      group_id: 7
                            )
                end
                if row[32] == "Voluntr.me" or row[31] == "Voluntr.me"
                      Assignment.create!(
                      user_id: User.last.id,
                      team_id: 3,
                      group_id: 7
                            )
                end 
               
       end
      
      puts "Users created"
        
        User.mentees.each do |mentee|
          n = mentee.mentor_uid
          mentee.mentor_id = n
          mentee.save
          puts mentee.last_name
        end

      
      
      
        
        
    
    
    
    
    
    
        