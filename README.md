CREATE YOUR SMURF AVATAR
 
The user can create an account to save his avatar and share it with others. 
The user can only update our delete his own avatar. 
An avatar has_many users.
A user belongs_to an avatar.
A user can create an avatar without being logged in but cannot save or edit.
Once signup the user doesn't need to signin until he intentionally logs out.

With the correct image rights this application could be added to a bigger website having for theme the smurfs or their author, Peyo. 

--------------------------------------------------------------------

Where to read more about it:
http://codingtalesbylizzie.com/my_smurf_project

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

