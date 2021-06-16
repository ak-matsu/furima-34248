FactoryBot.define do
  factory :order_address do
    postnum {'123-4567'}
    prefecture_id       { 2 }
    city  {'横浜'}
    banchi {'青山1−1−1'}
    tower {'柳ビル103'}
    phone {'09012345678'}

  end
end