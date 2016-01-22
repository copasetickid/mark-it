FactoryGirl.define do
  factory :bookmark do
    title "Wikipedia"
    uri "https://en.wikipedia.org/wiki/Main_Page"

    trait :adele do 
    	title "Adele"
    	uri "https://adele.com"
    end
  end

end
