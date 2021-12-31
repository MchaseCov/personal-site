# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Card.create(
  [
    { title: 'Hello & Welcome!',
      body: "My name is Chase Covington. I'm a web developer from SC.",
      call_to_action: 'Learn More About Me?',
      cta_path: 'about',
      icon_class: 'far fa-address-card',
      page_name: 'main' },
    { title: 'What do I do?',
      body: 'I love web development & using test-driven RESTful design patterns.',
      call_to_action: 'See some of my work?',
      cta_path: 'projects',
      icon_class: 'fas fa-code',
      page_name: 'main' },
    { title: 'Get to know me!',
      body: 'I enjoy sharing what I know, and talking about my experiences!',
      call_to_action: 'Check my blog out?',
      cta_path: 'projects',
      icon_class: 'far fa-handshake',
      page_name: 'main' }
  ]
)

Card.first.scrollers.create(
  [
    { body: 'Passionate' },
    { body: 'Architecture' },
    { body: 'Love the beach' },
    { body: 'Ambition' },
    { body: 'Cat lover' },
    { body: 'Art and Design' },
    { body: 'Curiosity Driven' },
    { body: 'Experimentation' },
    { body: 'Love for learning' },
    { body: 'Innovative' },
    { body: 'Determination' },
    { body: 'Cooking' },
    { body: 'South Carolina' },
    { body: 'PC Hardware' },
    { body: 'Momentum Workflow' },
    { body: 'Nature' },
    { body: 'Animal Crossing' },
    { body: 'Figuring out "Why?"' },
    { body: 'Photography' },
    { body: 'Excited' }
  ]
)

Card.second.scrollers.create(
  [
    { body: 'HTML' },
    { body: 'Turbo Links' },
    { body: 'Responsive Design' },
    { body: 'Postgres' },
    { body: 'MVC Frameworks' },
    { body: 'Javascript' },
    { body: 'RSpec' },
    { body: 'Rails' },
    { body: 'SQL' },
    { body: 'Test-Driven-Design' },
    { body: 'CSS' },
    { body: 'Turbo Frames' },
    { body: 'Tailwind' },
    { body: 'Bash' },
    { body: 'Git Push --Force' },
    { body: 'Devise' },
    { body: 'Stimulus' },
    { body: 'Ruby' },
    { body: 'Data Validation' },
    { body: 'Omniauth' }
  ]
)

Card.third.scrollers.create(
  [
    { body: 'Self-Teaching' },
    { body: 'Partnership' },
    { body: 'Documentation' },
    { body: 'Shared Experience' },
    { body: 'Reflection' },
    { body: 'Open-Source' },
    { body: 'Collaberation' },
    { body: 'Participation' },
    { body: 'Self-Expression' },
    { body: 'Community' },
    { body: 'Expertise' },
    { body: 'Learning from Feedback' },
    { body: 'Audience' },
    { body: 'Learning From Mistakes' },
    { body: 'Creative Outlet' },
    { body: 'Journey' },
    { body: 'Knowledge' },
    { body: 'Technical Content' },
    { body: 'Sharing Passions' },
    { body: 'Guiding Others' }
  ]
)
Project.create(
  [
    {
      title: 'Event Manager',
      screenshot_url: 'https://i.imgur.com/Xz43LMg.jpg',
      thumb_icon: 'fas fa-calendar-alt',
      full_desc: 'I built a site that allows users to create events and manage user signups. Users are able to sign up and then begin creating events and joining events that others have created. A user’s page displays the events they have created as well as the events they have signed up for. The home page displays all upcoming events, in order of date, and can be filtered by the state location of the event. Events can be edited or deleted by the creator, but past events cannot be deleted for archive purposes.

      This demo site is very simple but is where I experimented and learned much about Active Record relationships, associations, and customizing foreign keys and naming conventions.',
      small_desc: 'Demo website for creating and signing up for local events!',
      repo_url: 'https://github.com/MchaseCov/private-events',
      live_url: 'https://make-it-happen-events.herokuapp.com/',
      feature_list: ['Database Associations', 'Simple User Interface', 'Easily Sign Up For Events!']
    },
    {
      title: 'Flight Booker',
      screenshot_url: 'https://i.imgur.com/CjmWzu3.jpg',
      thumb_icon: 'fas fa-plane-departure',
      full_desc: 'This project is all about nested Active Record associations and passing around between various controllers and forms, you don’t want a user to type the same information multiple times! Users can pick a flight based on their departure and arrival airport choices. Javascript is used to limit arrival options to only airports the departure airport has a flight to. Flights with enough room for the tickets requested are able to be selected, and then users can submit passenger details to complete their purchase!

      This project was another learning opportunity for Active Record and helped me gain a stronger understanding on how Models and Controllers across the application are able to communicate.',
      small_desc: 'Demo website for searching for a flight and booking it!',
      repo_url: 'https://github.com/MchaseCov/flight-booker',
      live_url: 'https://flight-booker-top.herokuapp.com/flights',
      feature_list: ['Search Flights Based On Your Needs!', 'Suggests Alternatives If None Are Availible',
                     'Reponsive Javascript To Accurately Display Arrival Airports']
    },
    {
      title: 'Social Media Clone',
      screenshot_url: 'https://i.imgur.com/Q9sT3XG.jpg',
      thumb_icon: 'fas fa-user-friends',
      full_desc: 'In this project, I built a site that is functionally similar to Facebook. Users can sign up using either on-site registration or Omniauth with Facebook or Github. Users are able to customize their names, avatar, and profile banner. Users can interact with others by adding other users as friends, creating and joining groups, creating journal posts on their timeline or on other user’s profiles, or by sending messages that instantly update back-and-forth between the users. Users also receive notifications to make sure they don’t miss any interactions from their friends!

      This project is one of my favorites. A wide range of associated models in the database are able to communicate and come together into a unified whole where all the pieces are able to work together.',
      small_desc: 'Demo website for a social media site with posts, comments, chats, and pictures!',
      repo_url: 'https://github.com/MchaseCov/facebook-clone',
      live_url: 'https://friendsy.herokuapp.com/',
      feature_list: ['Create post on your timeline', 'Instantly message your friends',
                     'Realtime comments on posts and other comments', 'create a group to connect with others with the same interest']
    },
    {
      title: 'Multiplayer Chess',
      screenshot_url: 'https://i.imgur.com/lLrAvjv.jpg',
      thumb_icon: 'fas fa-chess-king',
      full_desc: 'This website features a fully-functioning game of Chess! You can create a game with another user (or yourself), or you can spectate a game being played by other users and even chat with them in real time. Making use of Hotwire for Rails, users can seamlessly click a chess piece to see where it can be moved and receive real-time updates for their opponent’s moves. The game calculates the board state to make sure that you can’t blunder your king and will automatically warn a player about check as well as inform them if they have been checkmated. The game also tracks a history of turns so a player can keep track of what’s happened.

      I created this website because I was excited to learn more about creating a dynamic application with instant user updates. This project also aided me to reinforce my knowledge with more general Ruby development, as well as the OOP and TTD processes.',
      small_desc: 'A Rails-based Chess game that instantly updates for all spectators!',
      repo_url: 'https://github.com/MchaseCov/multiplayer-chess',
      live_url: 'https://multiplayer-chess-mcc.herokuapp.com/',
      feature_list: ['Create a game of chess at any time', 'See all availible moves for each of your pieces',
                     'Chat with your opponent and spectators', 'Instant feedback if checked or checkmated']
    },
    {
      title: 'Personal Site',
      screenshot_url: 'https://i.imgur.com/clykCpV.jpg',
      thumb_icon: 'fas fa-user-tie',
      full_desc: 'This website is where you are at right now! This website features a simple, yet still dynamic, showcase of my development projects and who I am as a person. I make use of Hotwire, notably Turbo Frames, to create the sense of a Single Page Application while still keeping the various pages contained to their own views and controllers so that the information is only loaded upon the appropriate HTTP requests. Javascript event listeners also help reinforce a fluid feel of the website as it listens to begin and end page transitions, and use of Tailwind helps me efficiently keep the website responsive for both mobile and desktop users.

      If you have any feedback on how I could improve the website or do run into any trouble with features on it, please contact me to let me know! I would love to hear what you think and fix any bugs that cause you trouble!',
      small_desc: 'A showcase of my projects and who I am!',
      repo_url: 'https://github.com/MchaseCov/personal-site',
      live_url: 'https://github.com/MchaseCov/personal-site',
      feature_list: ['Simple UI to navigate various sections', 'View my favorite projects!',
                     'Hotwire for responsive page navigation']
    },
    {
      title: 'New Tab Dashboard',
      screenshot_url: 'https://i.imgur.com/xL5UIqE.jpeg',
      thumb_icon: 'fas fa-laptop-code',
      full_desc: "This is my personal dashboard that I use while working on projects. While it may not be the most visually advanced, this project is one that solved a real problem I was facing and I now use quite often. I wanted a way to keep myself more organized while I work and be able to stay on track if I have to take a break or split off onto a side project.

      The dashboard has a functional SSH terminal that makes use of the Secure Shell Chrome/Edge extension (so that it's still a local SSH, no shellinabox here!). I can keep working notes right next to my terminal, the most recently edited ones loading by default. Below my terminal is where I have access to a range of documentation and my recent Github repos. Below that, I have a region where I can add sticky notes to myself, which I treat as a more long term or generic kind of note compared to my “quick notes” notepad next to the terminal.

      You can access the website live on Heroku, but with the terminal and Github API functionality unavailable. You can still check out the SPA-style notepad and sticky notes or check out some documentations!",
      repo_url: 'https://github.com/MchaseCov/dashboard',
      small_desc: 'My personal dashboard for organized working!',
      live_url: 'https://dashboard-mcc.herokuapp.com/',
      hidden: false,
      feature_list: ['A fully functioning (when local) terminal', 'SPA updates for notepads and sticky notes',
                     'Organized workflow with notes, documentations, and quick links']
    },
    {
      title: 'Hotwire Scaffold Generator Gem',
      screenshot_url: 'https://i.imgur.com/29YfAv2.jpeg',
      thumb_icon: 'far fa-gem',
      small_desc: 'A Ruby gem library published for Rails & Hotwire applications',
      full_desc: "This project is unlike the others featured on this page. This is not a web application, but rather is a Ruby Gem library I developed for use in conjunction with the Hotwire for Rails framework. This Gem adds a custom scaffold generator to your Rails application to get up and running with a fully functional SPA suite in moments. This includes a Stimulus Javascript controller, the full Rails MVC suite for an object, and even testing files and fixtures! Your controller and views are generated with Turbo Stream formats to respond with real time page updates upon HTTP requests. It also wraps data entries inside of Turbo Frame tags to allow for responsive editing, updating, and deletion of created entries.

      I have used this in projects such as my New Tab Dashboard to get set up with the single page actions I need instantly, and published it online to be used or branched by anybody! You can check out a short demo video on how it works over on the Github repo. The live website button below will take you to the Rubygems page.",
      hidden: false,
      repo_url: 'https://github.com/MchaseCov/hotwire_scaffold_generator',
      live_url: 'https://rubygems.org/gems/hotwire_scaffold_generator',
      feature_list: ['A functional Ruby gem for Rails', 'Custom scaffolding to create a SPA app in moments',
                     'Published on rubygems.org']
    }
  ]
)
