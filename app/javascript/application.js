// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:before-fetch-request', async function (event) {
  event.preventDefault() // Stops the fetch of the next page
  let region = document.getElementById("animation-region") // At this point, this is still referencing the 'old' page's element.
  region.className += " animate__fadeOutLeft" // Add the fade out CSS class to the element (which automatically fires itself)
  region.addEventListener('animationend', function () { // Signals when the fade out animation is over.
    event.detail.resume() // Resumes loading from our earlier preventDefault!
  })
})