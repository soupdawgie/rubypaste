##Rubypaste

**Rubypaste** is a snippet storage for the code written (as you might guess) in **Ruby**—with the syntax highlighting in the manner of beautiful **Agate** theme.

Made for the sake of exercising and getting my hands dirty in Rails, RSpec and some JS after finishing The Rails Tutorial.

Some comments about the stack and features:

* The app is built with [Ruby 2.2.4](https://www.ruby-lang.org/en/) on [Rails 4.2.2](http://rubyonrails.org/).

* Layout sketched up with [Sass-powered Bootstrap](https://github.com/twbs/bootstrap-sass).

* Code within the snippets marked up with the [highlight.js](https://highlightjs.org/) script. Actually I could also make highlighting inside textareas with the [Ace](https://ace.c9.io/) (an embeddable code editor), but that's quite a different story.

* Share URLs became copypastable with the help of [clipboard.js](https://clipboardjs.com/) library.

* The app has two models (User and Snippet), they has one-to-many relationship.

* The authentication/authorization machinery built with [devise](https://github.com/plataformatec/devise): I just had to add some custom strong parameters, add some before_actions and rearrange the views to make them prettier (I've tried the [devise-bootstrap-views](https://github.com/hisea/devise-bootstrap-views) gem but was dissatisfied with it).

* Tests are the weak part of the app since I didn't have specific requirements—I've made some unit and integration tests inside **minitest**, but they were ruined after emergence of the User model and authentication mechanisms. It is the next big step—to cover all the things I've done with RSpec tests.

* The snippets are accessed with the **urlsafe_base64** string of 10 characters (to eliminate the possibility of scanning snippets by their incremental IDs). How it was made:

```ruby
# Routes (overriding the default resource identifier :id):
resources :snippets, param: :token

# Snippet class (generating URLs with token instead of id):
def to_param
  token
end

# Snippets controller (looking for records passing the token parameter):
@snippet = Snippet.find_by(token: params[:token])
```

* I've read some stackoverflow treads about friendly URLs and custom IDs instead of good old incremental integers; I've found the former kinda *semantically* invalid (since an URL like [http://localhost:3000/snippets/dcAESQ7SNBc5Yg/](example) could hardly be described as "friendly"), the latter just doesn't seem to be a good idea in the context of using a relational database.

* The app has a guest user—I'm using a predefined account and an autofilled form as a first implementation.

* The app makes extensive use of helpers—for getting the page titles, Bootstrap glyphicons, error messages, user appeals, guest user credentials and counting chars and lines of code.

###What's up next
* **Adding the "private" parameter to hide the snippets user doesn't will to share.**
* **Covering the whole application with the RSpec tests.**
* **Authorizing users with their usernames, not only the emails.**
* Configuring the mailers to make some essential functionalities (account confirmation, password reset) available.
* Reimplementing the guest user with the devise—the account must be reset with the end of the browser session.
* Implementing user profiles to make all their non-private snippets and info shareable.
* Making the app available to the non-authorized users.
