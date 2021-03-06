FactoryBot.define do
  factory :bidding do
    bid { 500 }
    association :listing, factory: :listing
    status { 'pending' }
  end
end
