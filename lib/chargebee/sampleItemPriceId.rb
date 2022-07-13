
require 'chargebee'
ChargeBee.configure(:site => "prajaktachavan-test",
  :api_key => "test_GdabskLx83Uu48Ow7Ibp4NAm7CNTML2b")

result = ChargeBee::Subscription.remove_coupons("AzqMMIT1eYluc2Lw",{
  :coupon_ids =>  ["cbdemo_earlybird","summer_offer_pyRet"]
  })
subscription = result.subscription
puts subscription

=begin
result = ChargeBee::Subscription.remove_coupons("AzqMMIT1eYluc2Lw",{
  :coupon_ids =>  ["cbdemo_earlybird","summer_offer_pyRet"]
  })
subscription = result.subscription
puts subscription

result = ChargeBee::Coupon.create_for_items({
  :id => "summer_offer_rbRet",
  :name => "Summer Offer_rbRet",
  :discount_percentage => 10.0,
  :discount_type => "percentage",
  :duration_type => "forever",
  :apply_on => "each_specified_item",
  :item_constraints => [
  {
          :constraint => "specific",
          :item_type => "plan",
          :item_price_ids => '["id1"]'
      },
    {
        :constraint => "specific",
        :item_type => "addon",
        :item_price_ids => '["id6","id7"]'
    },
    {
         :constraint => "specific",
         :item_type => "charge",
         :item_price_ids => '["charge-Non-USD-USD"]'
     }]
  })
coupon = result.coupon
puts coupon

list = ChargeBee::Subscription.list({
  :limit => 2
  })
list.each do |entry|
  subscription = entry.subscription
  puts subscription
end

result = ChargeBee::Customer.create({
  :first_name => "John1",
  :last_name => "Doe1",
  :email => "john@test.com",
  :locale => "fr-CA",
  :billing_address => {
    :first_name => "John",
    :last_name => "Doe",
    :line1 => "PO Box 9999",
    :city => "Walnut",
    :state => "California",
    :zip => "91789",
    :country => "US"
    }
  })
puts result.customer


result = ChargeBee::Address.update({
  :subscription_id => "cbdemo_trial_sub",
  :label => "shipping_address",
  :first_name => "Benjamin",
  :last_name => "Ross",
  :addr => "PO Box 9999",
  :city => "Walnut",
  :state => "California",
  :zip => "91789",
  :country => "US"
  })
address = result.address
puts address

serialized = ChargeBee::Util.serialize1({"item_constraints": [
                                               {"item_price_ids": [
                                                       "id1",
                                                       "id2"
                                                   ]
                                               },
                                               {"item_price_ids": [
                                                       "id3",
                                                       "id4"
                                                   ]
                                               }
                                               ]})
puts serialized
=end