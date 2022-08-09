// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap'

// Turbo.session.drive = false
Turbo.session.drive = true

// This sets the progress bar delay to 1ms
// Turbo.setProgressBarDelay(1000)
