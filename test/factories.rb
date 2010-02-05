Factory.define :page do |f|
end

Factory.define :user do |f|
	f.sequence(:username){|n| "username#{n}" }
	f.password "secret"
	f.sequence(:email){|n| "mail#{n}@another.fake.domain.com" }
	f.roles_mask 1
end
