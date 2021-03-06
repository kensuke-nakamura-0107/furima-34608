FactoryBot.define do
  factory :item do
    name {"塩分チャージ"}
    description {"塩分がチャージされます"}
    category_id {4}
    condition_id {2}
    postage_id {2}
    prefecture_id {22}
    period_id {2}
    price{2000}

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
