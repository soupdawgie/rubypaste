FactoryGirl.define do

  factory :snippet do
    title "Snippet title"
    code "def method\nputs \"Test string\"\nend"
  end

  factory :user do
    email "test@example.com"
    username "testuser"
    name "Test Example"
    password "password"
    password_confirmation "password"

      trait :invalid do
        email "test@example.com"
      end

      factory :user_with_snippets do

        transient do
          snippets_count 5
        end

        after(:create) do |user, evaluator|
          create_list(:snippet, evaluator.snippets_count, user: user)
        end
      end
  end
end
