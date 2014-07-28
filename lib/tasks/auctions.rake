namespace :auctions do
  desc 'Monitor new auctions'
  task :monitor do
    client = Syncano.sync_client
    collection = client.projects.find(1540).collections.first

    collection.subscribe unless client.subscriptions.all.any?{ |subscription| subscription.id == collection.id }

    client.append_callback(:monitor_auctions) do |notification|
      if notification.is_a?(Syncano::Resources::Notifications::Create)
        if notification[:data][:folder] == 'Auctions'
          title = notification[:data][:title]
          price = notification[:data][:additional][:price]
          category_id = notification[:data][:additional][:category_id]

          NotificationSetting.distinct_user_id.with_user.by_category_id(category_id).by_price(price).all.each do |setting|
            p setting.user.email
          end
        end
      end
    end
  end
end