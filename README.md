CREATE YOUR SMURF AVATAR
 
The user can create an account to save his avatar and share it with others. 
The user can only update our delete his own avatar. 
An avatar has_many users.
A user belongs_to an avatar.
A user can create an avatar without being logged in but cannot save or edit.
Once signup the user doesn't need to signin until he intentionally logs out.

With the correct image rights this application could be added to a bigger website having for theme the smurfs or their author, Peyo. 
--------------------------------------------------------------------
database:

female avatars
- eyes: blue, green, brown, black
- hair: blond, pink, purple, brown


male avatars male
- accessory: none, feather, paint, pencil
- eyes: blue, green, brown, black

users
- username
- email
- password_digest
- avatar_id

relationship:
- an avatar has_many :users
- a user has_one :avatar


--------------------------------------------------------------------
routes job:

application_controller:
get "/" : display the index, asking to create a smurf or a smurfette
get "/login": display the form to sign in
post "/login": check the password is the one associated with the email
post "/logout": delete the session hash

get "/avatars": display all the avatars

male_avatars_controller:

get "/male_avatars/new": display a form with pictures to click to create a smurf
post "/male_avatars": create the snurf avatar in the database and redirect to the smurf avatar page
get "/male_avatars/:id": display the smurf avatar page (options to edit, delete, user-profile, share)
get "/male_avatars/:id/edit": display the current smurf avatar and the form to change it
patch "/male_avatars/:id": update the smurf avatar
delete "/male_avatars/:id/delete": delete the smurf avatar

get "/female_avatars/new": display a form with pictures to click to create a smurfette
post "/female_avatars": create the smurfette avatar in the database and redirect to the smurfette avatar page
get "/female_avatars/:id": display the smurfette avatar page (options to edit, delete, user-profile, share)
get "/female_avatars/:id/edit": display the current smurfette avatar and the form to change it
patch "/female_avatars/:id": update the smurfette avatar
delete "/female_avatars/:id/delete": delete the smurfette avatar

users_controller:
get "/users/new": display signup form
post "/users": create the user in the database and redirect to user profile
get "/users/:id": display the user profile
get "/users/:id/edit": display the form to change the user informations
post "/users/:id": update the user information
delete "/users/:id/delete": delete the user

--------------------------------------------------------------------
views job: 

index.erb : Create a smurf or a smurfette? sign up/sign in

avatars: all avatars/share your avatar
female_avatars/new.erb: creation page 
female_avatars/show.erb: show the creation
female_avatars/edit.erb: change the creation
male_avatars/new.erb: creation page 
male_avatars/show.erb: show the creation
male_avatars/edit.erb: change the creation

users/new.erb: signup
users/show.erb: sign in / user profile
users/edit: edit the profile
possible avatars:

	females:

    -blue eyes / blond hair
    -blue eyes / pink hair
    -blue eyes / purple hair
    -blue eyes / brown hair

    -green eyes / blond hair
    -green eyes / pink hair
    -green eyes / purple hair
    -green eyes / brown hair

    -brown eyes / blond hair
    -brown eyes / pink hair
    -brown eyes / purple hair
    -brown eyes / brown hair

    -black eyes / blond hair
    -black eyes / pink hair
    -black eyes / purple hair
    -black eyes / brown hair

    male:

    -blue eyes / no accessory
    -blue eyes / feather
    -blue eyes / paint
    -blue eyes / pencil

    -green eyes / no accessory
    -green eyes / feather
    -green eyes / paint
    -green eyes / pencil

    -brown eyes / no accessory
    -brown eyes / feather
    -brown eyes / paint
    -brown eyes / pencil

    -black eyes / no accessory
    -black eyes / feather
    -black eyes / paint
    -black eyes / pencil

-------------------------------------------------------------------------------------------------------------









# Sinatra Content Management System App

## Overview

For this assessment you'll be creating any sort of CRUD app. The app should be a custom app that is created to track something important to you. Whether that's your golf club collection, or a travel app. These types of apps are generally referred to as CRUD (Create Read Update Delete apps) or simple Content Management Systems.

## Requirements

1. Build an MVC Sinatra Application.
2. Use ActiveRecord with Sinatra.
3. Use Multiple Models.
4. Use at least one `has_many` relationship
5. Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
6. Must have the abilty to create, read, update and destroy the resource that belongs to a user and only that user is able to edit it.
7. You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user. 

### Example Domains

 - [Golf Club Organizer](https://github.com/learn-co-curriculum/example-sinatra-assessment)
 - [Todo List](http://todomvc.com). Each task is part of a list
 - Collection of useful Ruby resources

If you are unsure about a domain or can't come up with an idea, feel free to reach out to fullstack@learn.co for some advice.

### Domains To Avoid

 As we spent a lot of time working with domains similiar to these during the Sinatra curriculum we do not accept these domain designs. 
  - Twitter Clone 
  - Blog Application
  
### Recomendations

 You do not have to make your routes any more complicated than `http://yourapp.com/posts/1`. We want to see you build a great CRUD application but we are not requiring you to build the next AirBnB. 

## Instructions

1. Create a new repository on GitHub for your Sinatra Application.
2. When you create the Sinatra app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
3. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. **This is important and you'll be graded on this**.
4. While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.
5. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
6. Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement *before* you submit your project.
7. [Fill out this checklist.](https://docs.google.com/forms/d/e/1FAIpQLSdIrS7g6y_B4dAY7HGS4yAndg9bfHuw7GmsiwA6MQXXqNrDjA/viewform?entry.237262577&entry.835010005&entry.301147721)
8. Prepare a short video demo (narration helps!) describing how a user would interact with your working application.
9. Write a blog post about the project and process.
10. When done, submit your GitHub repo's url, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.

Unlike the rest of the curriculum, if you have any questions about your assessment or need help with it, please *don’t* use the Ask New Question feature. Rather than working with Learn Experts, please reach out to your Learn Instructor responsible for this section instead

## If you're a Learn-Verified Premium student:

We'll send an email to you soon to schedule a pairing process. If you don't hear from us in 48 hours after submission, get in touch!

### Be Prepared to:

1. Confirm your application meets the requirements above. We'll go through your app and ask you to show us how it meets the requirements above. 5-10 mins.
2. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works. 10-15 mins.
3. Live coding, doing a refactoring exercise to make sure you're comfortable working with your code. 10-15 mins.

### What to expect from the pairing session

Project reviews are focused on preparing you for technical interviews. Treat project reviews as if they were technical interviews, in both attitude and technical presentation. 

#### Be scrappy.
- If you make a mistake, correct yourself. 
- Think on your feet. We will expect you to be able to explain development concepts to us, as well as expanding on concepts that you have already implemented, but you’ll also have the opportunity to look things up while you're live coding.

#### Make no little plans.
- You're going to learn a ton. We will give pointers and show you ways to improve your code. This isn't telling you that your code is wrong, it's simply us teaching. 
- Approach live coding with a constructive attitude. You might feel nervous or uncertain, but as long as you are familiar with the section material you should be able to reason your way to a solution.
- Be proud of your project and your code, and show confidence in it. 

#### Radiate positivity.
- Present yourself and your project in the best way possible. 
- Be open to feedback, both positive and constructive. 
- If the instructor asks you to complete additional features, or you missed a project requirement, treat this as a learning experience. Becoming  a developer is complex and challenging, and it’s our job to find the holes in your knowledge and help you fill them. This is to help you become a better developer, not to delay your progress in the program.

#### Work Together.
- Trust yourself.
- Trust us  - our goal is to help you be successful in achieving your goals.
- We understand that this process can be stressful. We’re here to help you through.

#### Pursue mastery.
- Use the best technical vocabulary you can.
- Explain the details - this is your application, you'll be expected to have a solid understand of how it works"
- Ask questions! Curiosity and willingness to learn are hugely valued in our industry.  If you haven’t heard of something, that’s okay - use this opportunity to learn about it!


### What won't happen:

- You won't be told you're ever wrong
- You won't be yelled at, belittled, or scolded
- You won't be put on the spot without support
- There's nothing you can do to instantly fail or blow it.

<p class='util--hide'>View <a href='https://learn.co/lessons/sinatra-cms-app-assessment'>Sinatra Assessment</a> on Learn.co and start learning to code for free.</p>

<p class='util--hide'>View <a href='https://learn.co/lessons/sinatra-cms-app-assessment'>Sinatra Portfolio Project</a> on Learn.co and start learning to code for free.</p>
