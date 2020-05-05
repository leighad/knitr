#App Overview
    This is a pattern sharing app called knitr where a user can CRUD patterns and make comments on other user's patterns.

#User Stories
    Users will be able to:
    -sign up, log in, log out

    Users can:
    -create a pattern
    -retrieve personal pattern collection
    -update a pattern
    -delete a pattern

#Wireframing (attributes and associations)
    Models will be:
    User, Pattern, Comment

    User attributes:
        user_name
        email
        password (with bcrypt will be password_digest in db)

    User associations:
        has_secure_password
        has_many :patterns
        has_many :comments, through: :patterns ???


    Pattern attributes:
        pattern_name
        gauge
        difficulty_level
        instructions
        notes
        user_id

    Pattern associations:
        belongs_to :user
        has_many :comments, through: :users ???


    Comment attributes:
        user_id
        pattern_id 
        date 
        content

    Comment associations:
        belongs_to :pattern
        belongs_to :user

#MVP
    *see spec.md file for checklist*

#Stretch Goals
    -style nicely with CSS
    -add tool box pairing feature


Day one:
    -init and set up project structure
    -wireframing
    - 
