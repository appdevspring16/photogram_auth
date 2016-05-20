# Photogram / Auth

In this project, we'll practice tailoring the experience for users by allowing them to sign in so that we know who they are. We'll use the Devise gem to make authentication a snap.

We'll be building a simple clone of [Instagram](https://www.instagram.com/).

[Here is your target for the required parts of the assignment](https://photogram-auth-target.herokuapp.com/) (associations, authentication).

## Domain Model

Suppose we design the following domain model for our application:

                                   +---------------------+
                                   |                     |
                                   |Comment              |
                                  /|=======              |\
                   +---------------|- body:text          |---------------+
                   |              \|- photo_id:integer   |/              |
                   |               |- user_id:integer    |               |
                   |               |                     |               |
                   |               +---------------------+               |
                   |                                                     |
                   |                                                     |
                   -                                                     -
                   |                                                     |
        +---------------------+                               +---------------------+
        |                     |                               |User                 |
        |Photo                |                               |====                 |
        |=====                |\                              |- username:string    |
        |- caption:string     |-----------------------------|-|- Devise columns     |
        |- image:string       |/                              |(email, password,    |
        |- user_id:integer    |                               |etc)                 |
        |                     |                               |                     |
        +---------------------+                               +---------------------+
                   |                                                     |
                   -                                                     -
                   |                                                     |
                   |                                                     |
                   |               +---------------------+               |
                   |               |                     |               |
                   |               |Like                 |               |
                   |              /|====                 |\              |
                   +---------------|- photo_id:integer   |---------------+
                                  \|- user_id:integer    |/
                                   |                     |
                                   |                     |
                                   +---------------------+

  - Associations
     - Users have many photos, a photo belongs to a user
     - Photos have many comments, a comment belongs to a photo
     - Users have many comments, a comment belongs to a user
     - Users have many likes, a like belongs to a user
     - Photos have many likes, a like belongs to a photo
     - Users have many `liked_photos` through likes. Since this breaks naming conventions (the method name, `.liked_photos`, does not exactly match the class name, `Photo`), we'll have to write out the full form of the has_many/through:

        ```ruby
        has_many :liked_photos, :through => :likes, :source => :photo
        ```

     - Similarly, Photos have many fans through likes (source: user):

        ```ruby
        has_many :fans, :through => :likes, :source => :user
        ```

  - Validations
     - User
         - username: presence, uniqueness
     - Photo
         - user_id: presence
     - Like
         - user_id: presence, uniqueness in combination with photo
         - photo_id: presence
     - Comment
         - user_id: presence
         - photo_id: presence
         - body: presence

Right now, this is a brand new application with nothing at all in it. Your job is to make it function and look like the target.

Below I suggest a plan of attack. Try to imagine, as you go through it, how each step would apply to your own app idea.

## Steps

1. Add [starter_generators](https://gist.github.com/raghubetina/80d3cf2cf82666ed1c0f) and [Devise](https://gist.github.com/raghubetina/9ef4a9ffa4604df74bb5) to the Gemfile.
1. `bundle install`
1. Generate the User table [with Devise](https://gist.github.com/raghubetina/9ef4a9ffa4604df74bb5#generate-a-new-model-with-devise):

    ```shell
    rails generate devise:install
    rails generate devise user username:string
    ```

    Devise will automatically add email, password, and all the other columns that it needs to secure accounts. You just specify any columns you want besides those (in this case, we want usernames).

1. Generate the rest of your CRUD resources [with starter_generators](https://gist.github.com/raghubetina/80d3cf2cf82666ed1c0f#resources):

    ```shell
    rails generate starter:resource photo caption:text image:string user_id:integer
    rails generate starter:resource like user_id:integer photo_id:integer
    rails generate starter:resource comment photo_id:integer body:text user_id:integer
    ```

1. Now that you have generated your model files, add all of the associations and validations listed above immediately.
1. Set the root URL to the photos index page:

    ```ruby
    # In config/routes.rb
    root "photos#index"
    ```
1. You can finally `rails server` and navigate to [http://localhost:3000](http://localhost:3000) to see your work so far. If you haven't `rake db:migrate`d yet, it will ask you to now.
1. Generate [a better application layout](https://gist.github.com/raghubetina/80d3cf2cf82666ed1c0f#application-layout), including Bootstrap:

    ```shell
    rails generate starter:style paper
    ```

1. I've included some random starter data for you to use while developing:

    ```shell
    rake db:seed
    ```

    Now click around the app and see what we've got. (If you're curious, I used the [faker gem](https://github.com/stympy/faker) to create the silly random seed comments. It's very useful for quickly generating random names, addresses, etc.)

1. Let's require that someone be signed in before they can do anything else. In `application_controller.rb`, add the line

    ```ruby
    before_action :authenticate_user!
    ```

    Now try and navigate around the app. It should demand that you sign in before allowing you to visit any page.

1. Sign in with one of the seeded users; you can use `alice@example.com`, `bob@example.com`, or `carol@example.com`. All of the passwords are `12341234`.

1. Fix the dummy edit profile and sign-out links in the navbar.
 - If there is currently a signed-in user,
     - The link to edit profile should display the signed-in user's username instead.
     - The link to sign out should work as is, but remove the word "dummy".
 - If not, display links to sign-in (`/users/sign_in`) and sign-up (`/users/sign_up`) instead.

1. On the new photo form, the user should not have to provide their ID number. Fix it using Devise's `current_user` helper method to prepopulate that input.

1. Create an RCAV: When I visit [http://localhost:3000/users](http://localhost:3000/users), I should see an index of all users. This RCAV does not exist right now, since we used Devise to generate the User resource rather than starter_generators. Devise only builds the RCAVs required for sign-up/sign-in/sign-out/etc; it doesn't build the standard Golden Seven. But that's okay, because we can easily add the ones that we want ourselves (if any). Once done, add a link to the navbar.

1. Create an RCAV: When I visit [http://localhost:3000/users/1](http://localhost:3000/users/1), I should see the details of user #1 along with all of his or her photos. Once done, add a link to the navbar that leads to the current user's show page. (This may lead to a problem when no one is signed in -- how can you fix it? Also, be careful where you add this route in `routes.rb` -- it needs to be below the line `devise_for :users`, otherwise it will conflict with `/users/sign_in` and `/users/sign_up`.)

1. Create an RCAV: When I visit [http://localhost:3000/my_likes](http://localhost:3000/my_likes), I should see only the photos that I have liked.  Once done, add a link to the navbar.

1. On the photo show page, I should only see the "Edit" and "Delete" buttons if it is my own photo.

1. Make the photos look like [the target](https://photogram-auth-target.herokuapp.com/photos):
  - Useful Bootstrap things: [panel with heading](http://getbootstrap.com/components/#panels-heading), [media list](http://getbootstrap.com/components/#media-list), [img-responsive](http://getbootstrap.com/css/#images-responsive), [text-muted](http://getbootstrap.com/css/#helper-classes-colors), [heading subtext](http://getbootstrap.com/css/#type-headings)
  - Useful Rails methods: [time_ago_in_words](http://apidock.com/rails/ActionView/Helpers/DateHelper/time_ago_in_words), [.pluck](http://guides.rubyonrails.org/active_record_querying.html#pluck), [.to_sentence](http://apidock.com/rails/Array/to_sentence)

   View Source on the target if you need to.

1. **Make the form to quick-add a comment directly below a photo work.**
1. **Make the heart to quick-add/delete a like directly below a photo work.**
1. [Customize the generated sign-in/sign-out/edit profile forms](https://gist.github.com/raghubetina/9ef4a9ffa4604df74bb5#customizing-devise-views) to a) include a field for username, b) make them look nicer. [Here are some Bootstrapped Devise forms that you can build off of](https://github.com/firstdraft/bootstrapped_devise_forms), but you need to add a field for username, and then [let that param through additional security](https://gist.github.com/raghubetina/9ef4a9ffa4604df74bb5#step-three-allow-additional-parameters-through-security) before the form will work.

1. Optional: Use [the Carrierwave cheatsheet](https://gist.github.com/raghubetina/ec1b65713e9e8f863539) to enable image uploads (rather than pasting in existing URLs). You'll find an accompanying video under Pages in Canvas.
1. Optional: Follow [the Tweeter example project](https://github.com/firstdraft/tweeter) to enable followers/timeline. You'll find an accompanying video titled "Social Network" under Pages in Canvas.

[Here is a target for the optional parts of the assignment](https://photogram-final-target.herokuapp.com/) (file uploads, social network).

## Good luck! Ask lots of questions!
