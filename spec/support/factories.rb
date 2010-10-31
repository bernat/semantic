Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@semantic.cat" }
  u.password 'semantic'
  u.password_confirmation 'semantic'
end
