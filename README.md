##Rubypaste

**Rubypaste** is a snippet storage for the code written (as you might guess) in **Ruby**.

Made for the sake of exercising and getting my hands dirty in Rails, RSpec and some JS after finishing The Rails Tutorial.

###Stack and features

* Framework: [Ruby 2.2.4](https://www.ruby-lang.org/en/) on [Rails 4.2.2](http://rubyonrails.org/).

* Layout: [Sass-powered Bootstrap 3](https://github.com/twbs/bootstrap-sass).

* Code markup: [highlight.js](https://highlightjs.org/).

* Share URLs: [clipboard.js](https://clipboardjs.com/).

* Authorization: [Devise](https://github.com/plataformatec/devise), heavily customized views, some before_actions.

* Testing: **RSpec**, **Capybara**, **FactoryGirl**.

* The snippets are accessed with a **urlsafe_base64** string of 10 characters instead of incremental IDs.

* Guest user: DB seeds + form autofill as first implementation.

###What's up next
* **Done: the "Public" checkbox to hide the snippets.**
* **In progress: Rock-solid RSpec test suit.**
* **User authorization via usernames.**
* Mailers configuration to make account confirmations and password resets available.
* Guest user reimplementation (user must be reset after the browser session ends).
* User profiles.
* Some functionality for the non-authorized users.
