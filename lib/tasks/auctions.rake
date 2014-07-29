namespace :auctions do
  desc 'Monitor new auctions'
  task :monitor do
    client = Syncano.sync_client
    collection = SYNCANO_ACTIVERECORD_COLLECTION

    collection.subscribe unless client.subscriptions.all.any?{ |subscription| subscription.id == collection.id }

    client.append_callback(:monitor_auctions) do |notification|
      if notification.is_a?(Syncano::Resources::Notifications::Create)
        if notification[:data][:folder] == 'Auctions'
          auction = Auction.find(notification[:data][:id])
          category = Category.find(notification[:data][:additional][:category_id])

          user_ids = category.notification_settings.by_price(auction.price).all.collect{ |setting| setting.user_id }.uniq

          User.where('id IN (?)', user_ids).all.each do |user|
            NotificationMailer.auction_published(user, auction).deliver!
          end
        end
      end
    end

    sleep(10) while true # Syncano won't block main thread
  end
end