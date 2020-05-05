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
        username
        email
        password_digest 

    User associations:
        has_secure_password
        has_many :patterns
        has_many :comments
        has_many :commented_patterns, through: :comments, source: :pattern


    Pattern attributes:
        pattern_name
        gauge :integer
        level :integer
        instructions :text
        notes

        user_id

    Pattern associations:
        belongs_to :user
        has_many :comments
        has_many :users, through: :comments


    Comment attributes:
        rating :integer
        content :text
        
        user_id
        pattern_id 

    Comment associations:
        belongs_to :user
        belongs_to :pattern

#MVP
    *see spec.md file for checklist*

#Stretch Goals
    -style nicely with CSS
    -add tool box pairing feature


Day one:
    -init and set up project structure
    -wireframing
    - 
