Factory.sequence(:dog_name) { |n| "string_#{n}" }

Factory.define :dog do |d|
  d.name { Factory.next(:dog_name) }
  d.age 1
end
