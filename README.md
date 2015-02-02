# Syncano ruby gem demo

This is a demo Ruby on Rails application for [Syncano ruby gem](https://github.com/Syncano/syncano-ruby) - library for communication with Syncano ([www.syncano.com](http://www.syncano.com)) 

Click here to learn more about [Syncano](http://www.syncano.com) or [create an account](https://login.syncano.com/sign_up)!

Below are described most important parts of the app.

## Initializer

[Initializer](config/initializers/syncano.rb) contains basic configuration for Syncano client and Syncano ActiveRecord.

## Syncano ActiveRecord

Some models ([Auction](app/models/auction.rb), [Category](app/models/category.rb), [NotificationSetting](app/models/notification_setting.rb)) are stored in the Syncano. They inherit from Syncano::ActiveRecord::Base class.
 As you can see they looks quite similar to standard ActiveRecord::Base classes. The main difference is a necessity of defining attributes.
 
## Syncano notifications

There is [a rake task](lib/tasks/auctions.rake) which allows for notifying users about new auctions. It uses Syncano Sync API.

## More information

For more information check Syncano ruby gem [documentation](http://rubydoc.info/gems/syncano/3.1.1/frames) and [Syncano Docs](http://docs.syncano.com).
