// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

// TODO: Research more on Rails 7 importmaps to split this file up in a way similar to webpack

// ANIMATIONS ======================================================================================

// PROJECT LOAD TRANSITION
// The reason this does not simply listen for an animation end to resume, is
// to prevent a page 'jump' in the .2 seconds where the new content is still
// animating in, and the DOM items below the new content try to jump up and
// fill in that space.

// Prevents jump with margin
const preventJumpWithMargin = (region, event) => {
  region.classList.add('completed');
  region.classList.remove('expand-turbo-parent');
  document.getElementById('hold').classList.add('mb-[61.7rem]'); // prevents a tiny .2 second jump when the turbo frame loads in
  event.detail.resume();
};

// Adds the grid-down animation class
const gridDownwardAnimation = (region, event) => {
  region.classList.add('expand-turbo-parent');
  region.addEventListener('animationend', () => {
    if (!region.classList.contains('completed')) {
      preventJumpWithMargin(region, event);
    }
  });
};

// PROJECT GRID TRANSITION Called from event listener
const animateProjectsDown = (event) => {
  const region = document.getElementById('project-information');
  if (region.classList.contains('completed')) {
    event.detail.resume();
  } else {
    gridDownwardAnimation(region, event);
  }
};

// PAGE -> PAGE SITEWIDE TRANSITION Called from event listener
const animateNewPage = (event) => {
  const region = document.getElementById('animation-region');
  region.addEventListener('animationend', () => {
    event.detail.resume();
  });
  region.classList.add('animate__fadeOutLeft');
};

// DARK MODE TOGGLE ================================================================================
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

// LISTENERS =======================================================================================

// The buttons would probably be better as a click => fumction call in the HTML but I would like to
// research if there are any pros vs cons to it first.
mainButton.addEventListener('click', () => {
  darkMode(mainButton);
});

footerButton.addEventListener('click', () => {
  darkMode(footerButton);
});

// Drops down project preview window upon click of a project thumbnail
document.addEventListener('turbo:before-fetch-request', async (event) => {
  event.preventDefault(); // Stops BEFORE a network request is sent to fetch page
  if (event.target.id === 'project-information') {
    animateProjectsDown(event);
  } else {
    animateNewPage(event);
  }
});

// When a project loads in, remove the margin buffer that was added to prevent jumpskip
document.addEventListener('turbo:frame-load', async (event) => {
  if (event.target.id === 'project-information') {
    document.getElementById('hold').classList.remove('mb-[61.7rem]');
  }
});
