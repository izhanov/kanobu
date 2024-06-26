import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "rock", "paper", "scissors", "modal", "userChoise"]

  choose(event) {
    const choise = this.defineChoise(event)
    const choiseElement = this[`${choise}Target`]
    const imgSource = choiseElement.querySelector('img').src

    const img = this.addUserChoiseImg(imgSource)

    this.userChoiseTarget.prepend(img)

    const modal = new bootstrap.Modal(this.modalTarget, {backdrop: 'static'})

    modal.show()
  }


  // private
  defineChoise(event) {
    let choise;
    if (event.target.parentElement.dataset.toolTarget) {
      choise = event.target.parentElement.dataset.toolTarget
    } else {
      choise = event.target.dataset.toolTarget
    }
    return choise;
  }

  addUserChoiseImg(src) {
    const img = document.createElement('img')
    img.setAttribute("width", "100")
    img.setAttribute("height", "100")
    img.src = src
    return img
  }
}
