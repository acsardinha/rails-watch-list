//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../builds

Rails.application.config.assets.paths << Rails.root.join("node_modules")
