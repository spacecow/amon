Factory.define :message do |f|
end

Factory.define :page do |f|
	f.sequence(:name){|n| "name#{n}" }
	f.sequence(:navlabel){|n| "navlabel#{n}" }
end

Factory.define :user do |f|
	f.sequence(:username){|n| "username#{n}" }
	f.password "secret"
	f.sequence(:email){|n| "mail#{n}@another.fake.domain.com" }
	f.roles_mask 1
end
