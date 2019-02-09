FactoryBot.define do
  factory :set, class: Array do
    trait :set1 do
      projects do
        [
          FactoryBot.build(:project, :low_cost, :project1_set1)
        ]
      end
    end

    trait :set2 do
      projects do
        [
          FactoryBot.build(:project, :low_cost, :project1_set2),
          FactoryBot.build(:project, :high_cost, :project2_set2),
          FactoryBot.build(:project, :low_cost, :project3_set2)
        ]
      end
    end

    trait :set3 do
      projects do
        [
          FactoryBot.build(:project, :low_cost, :project1_set3),
          FactoryBot.build(:project, :high_cost, :project2_set3),
          FactoryBot.build(:project, :high_cost, :project3_set3)
        ]
      end
    end

    trait :set4 do
      projects do
        [
          FactoryBot.build(:project, :low_cost, :project1_set4),
          FactoryBot.build(:project, :low_cost, :project2_set4),
          FactoryBot.build(:project, :high_cost, :project3_set4),
          FactoryBot.build(:project, :high_cost, :project4_set4)
        ]
      end
    end

    initialize_with { attributes[:projects] }
  end
end


