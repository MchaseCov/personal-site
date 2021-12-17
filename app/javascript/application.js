// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

class Turn {
  constructor(action) {
    this.action = action
    this.exitClasses = new Set()
    this.enterClasses = new Set()
  }

  exit() {
    this.animateOut = animationsEnd('[data-turn-exit]')
    this.addClasses('exit')
  }

  async beforeEnter(event) {
    if (this.action === 'restore') return

    event.preventDefault()

    if (this.isPreview) {
      this.hasPreview = true
      await this.animateOut
    } else {
      await this.animateOut
      if (this.animateIn) await this.animateIn
    }

    event.detail.resume()
  }

  async enter() {
    this.removeClasses('exit')

    if (this.shouldAnimateEnter) {
      this.animateIn = animationsEnd('[data-turn-enter]')
      this.addClasses('enter')
    }
  }

  async complete() {
    await this.animateIn
    this.removeClasses('enter')
  }

  get shouldAnimateEnter() {
    if (this.action === 'restore') return false
    if (this.isPreview) return true
    if (this.hasPreview) return false
    return true
  }

  get isPreview() {
    return document.documentElement.hasAttribute('data-turbo-preview')
  }

  addClasses(type) {
    document.documentElement.classList.add(`turn-${type}`)

    Array.from(document.querySelectorAll(`[data-turn-${type}]`)).forEach((element) => {
      (element.dataset[`turn${capitalize(type)}`]).split(/\s+/).forEach((klass) => {
        if (klass) {
          element.classList.add(klass)
          this[`${type}Classes`].add(klass)
        }
      })
    })
  }

  removeClasses(type) {
    document.documentElement.classList.remove(`turn-${type}`)

    Array.from(document.querySelectorAll(`[data-turn-${type}]`)).forEach((element) => {
      this[`${type}Classes`].forEach((klass) => element.classList.remove(klass))
    })
  }
}

Turn.start = function () {
  for (var event in this.eventListeners) {
    addEventListener(event, this.eventListeners[event])
  }
}

Turn.stop = function () {
  for (var event in this.eventListeners) {
    removeEventListener(event, this.eventListeners[event])
  }
  delete this.currentTurn
}

Turn.eventListeners = {
  'turbo:visit': function (event) {
    this.currentTurn = new this(event.detail.action)
    this.currentTurn.exit()
  }.bind(Turn),
  'turbo:before-render': function (event) {
    this.currentTurn.beforeEnter(event)
  }.bind(Turn),
  'turbo:render': function () {
    this.currentTurn.enter()
  }.bind(Turn),
  'turbo:load': function () {
    if (this.currentTurn) this.currentTurn.complete()
  }.bind(Turn)
}

function animationsEnd(selector) {
  const elements = [...document.querySelectorAll(selector)]

  return Promise.all(elements.map((element) => {
    return new Promise((resolve) => {
      function listener() {
        element.removeEventListener('animationend', listener)
        resolve()
      }
      element.addEventListener('animationend', listener)
    })
  }))
}

function capitalize(string) {
  return string.replace(/^\w/, (c) => c.toUpperCase())
}
Turn.start()