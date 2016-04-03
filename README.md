##Rubypaste

**Rubypaste** is a snippet storage for the code written (as you might guess) in **Ruby**—with the syntax highlighting in the manner of beautiful **Agate** theme.

Made for the sake of exercising and getting my hands dirty in some JS.

Some comments about the stack and features:
* The app is built with [Ruby 2.2.4](https://www.ruby-lang.org/en/) on [Rails 4.2.2](http://rubyonrails.org/).

* Layout sketched up with [Sass-powered Bootstrap](https://github.com/twbs/bootstrap-sass).

* Code within the snippets marked up with the [highlight.js](https://highlightjs.org/) script. Actually I could also make highlighting inside textareas with the [Ace](https://ace.c9.io/) (an embeddable code editor), but that's quite a different story.

* The snippets are accessed with the **urlsafe_base64** string of 10 characters. How it was made:
```ruby
# Routes (overriding the default resource identifier :id):
resources :snippets, param: :token

# Snippet class (generating URLs with token instead of id):
def to_param
  token
end

# Snippets controller (looking for records passing the token parameter)"
@snippet = Snippet.find_by(token: params[:token])
```
I've read some stackoverflow treads about friendly URLs and custom IDs instead of good old incremental integers; I've found the former kinda *semantically* invalid (since an URL like [http://localhost:3000/snippets/dcAESQ7SNBc5Yg/](example) could hardly be described as "friendly"), the latter just doesn't seem to be a good idea in the context of using a relational database.
