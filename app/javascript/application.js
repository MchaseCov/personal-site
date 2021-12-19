// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Drops down project preview window upon click of a project thumbnail
document.addEventListener('turbo:before-fetch-request', async (event) => {
  event.preventDefault()
  // project-grid transition
  if (event.target.id == "project-information") {
    let region = document.getElementById("project-information")
    if (region.classList.contains("completed")) { event.detail.resume(); return }
    else {
      region.classList.add("expand-turbo-parent");
      region.addEventListener('animationend', () => {
        if (!region.classList.contains("completed")) {
          region.classList.add("completed")
          region.classList.remove("expand-turbo-parent")
          document.getElementById("hold").classList.add("mb-[61.7rem]") //prevents a tiny .2 second jump when the turbo frame loads in
          event.detail.resume()
        }
      })
      document.addEventListener('turbo:frame-load', async function (event) {
        if (event.target.id == "project-information") {
          document.getElementById("hold").classList.remove("mb-[61.7rem]")
        }
      })
    }
  } else { //side-wide transition
    let region = document.getElementById("animation-region")
    region.classList.add("animate__fadeOutLeft")
    region.addEventListener('animationend', () => { event.detail.resume() })
  }
})
