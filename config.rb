
require 'slim'
compass_config do |config|
  config.output_style = :compressed
end
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'
set :slim, :pretty => true
set :layout, :main

# Build-specific configuration
configure :build do
  activate :cache_buster
  activate :relative_assets
end