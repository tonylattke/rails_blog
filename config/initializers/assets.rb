# Javascript
Rails.application.config.assets.precompile += %w( jquery-1.10.2.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )

Rails.application.config.assets.precompile += %w( posts.js )

# Css
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )

Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.eot )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.svg )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.ttf )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.woff )