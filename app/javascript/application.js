// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

// TODO: Research more on Rails 7 importmaps to split this file up in a way similar to webpack

// Drops down project preview window upon click of a project thumbnail
document.addEventListener('turbo:before-fetch-request', async (event) => {
  event.preventDefault();
  // project-grid transition
  if (event.target.id === 'project-information') {
    const region = document.getElementById('project-information');
    if (region.classList.contains('completed')) {
      event.detail.resume();
    } else {
      region.classList.add('expand-turbo-parent');
      region.addEventListener('animationend', () => {
        if (!region.classList.contains('completed')) {
          region.classList.add('completed');
          region.classList.remove('expand-turbo-parent');
          document.getElementById('hold').classList.add('mb-[61.7rem]'); // prevents a tiny .2 second jump when the turbo frame loads in
          event.detail.resume();
        }
      });
      document.addEventListener('turbo:frame-load', async (event) => {
        if (event.target.id === 'project-information') {
          document.getElementById('hold').classList.remove('mb-[61.7rem]');
        }
      });
    }
  } else {
    // side-wide transition
    const region = document.getElementById('animation-region');
    region.classList.add('animate__fadeOutLeft');
    region.addEventListener('animationend', () => {
      event.detail.resume();
    });
  }
});

// Dark Mode Toggle

const html = document.querySelector('html');
const mainButton = document.querySelector('.toggle-theme');
const footerButton = document.querySelector('.toggle-theme-footer');

function darkMode(button) {
  if (html.dataset.theme === 'personaldark') {
    html.dataset.theme = 'personaltheme';
    document.cookie = 'darkmode=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
  } else {
    html.dataset.theme = 'personaldark';
    document.cookie = 'darkmode=dark mode on';
  }
  button.classList.toggle('fa-sun');
  button.classList.toggle('fa-moon');
}

// The buttons would probably be better as a click => fumction call in the HTML but I would like to
// research if there are any pros vs cons to it first.
mainButton.addEventListener('click', () => {
  darkMode(mainButton);
});

footerButton.addEventListener('click', () => {
  darkMode(footerButton);
});
