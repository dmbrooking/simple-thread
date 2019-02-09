FactoryBot.define do
  factory :project do
    start_date { Date.today }
    end_date { Date.today + 1 }

    trait :low_cost do
      city { build(:low_cost_city) }
    end

    trait :high_cost do
      city { build(:high_cost_city) }
    end

    trait :project1_set1 do
      start_date { Date.new(2015, 9, 1) }
      end_date { Date.new(2015, 9, 3) }
    end

    trait :project1_set2 do
      start_date { Date.new(2015, 9, 1) }
      end_date { Date.new(2015, 9, 1) }
    end

    trait :project2_set2 do
      start_date { Date.new(2015, 9, 2) }
      end_date { Date.new(2015, 9, 6) }
    end

    trait :project3_set2 do
      start_date { Date.new(2015, 9, 6) }
      end_date { Date.new(2015, 9, 8) }
    end

    trait :project1_set3 do
      start_date { Date.new(2015, 9, 1) }
      end_date { Date.new(2015, 9, 3) }
    end

    trait :project2_set3 do
      start_date { Date.new(2015, 9, 5) }
      end_date { Date.new(2015, 9, 7) }
    end

    trait :project3_set3 do
      start_date { Date.new(2015, 9, 8) }
      end_date { Date.new(2015, 9, 8) }
    end

    trait :project1_set4 do
      start_date { Date.new(2015, 9, 1) }
      end_date { Date.new(2015, 9, 1) }
    end

    trait :project2_set4 do
      start_date { Date.new(2015, 9, 1) }
      end_date { Date.new(2015, 9, 1) }
    end

    trait :project3_set4 do
      start_date { Date.new(2015, 9, 2) }
      end_date { Date.new(2015, 9, 2) }
    end

    trait :project4_set4 do
      start_date { Date.new(2015, 9, 2) }
      end_date { Date.new(2015, 9, 3) }
    end

    initialize_with { new(city, start_date, end_date) }
  end
end
