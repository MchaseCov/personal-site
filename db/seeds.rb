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
