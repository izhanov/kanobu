import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "rock",
    "paper",
    "scissors",
    "waitingModal",
    "resultModal",
    "resultModalTitle",
    "userChoise",
    "curbChoise"
  ]

  connect() {
    this.resultModalTarget.addEventListener('hidden.bs.modal', (event) => {
     this.removeResultContent()
    })
  }

  choose(event) {
    const choise = this.defineChoise(event)
    const choiseElement = this[`${choise}Target`]
    const imgSource = choiseElement.querySelector('img').src

    const img = this.createUserChoiseImg(imgSource)

    this.userChoiseTarget.prepend(img)

    const waitingModal = new bootstrap.Modal(this.waitingModalTarget, {backdrop: 'static'})
    waitingModal.show()

    const resultModal = new bootstrap.Modal(this.resultModalTarget)

    this.fetchCurbChoise(choise).then(
      response => response.json()
    ).then((data) => {
        waitingModal.hide()
        this.userChoiseTarget.querySelector('img').remove()

        const curbChoiseElement = this[`${data.result.curb_bet}Target`]
        const curbImgSource = curbChoiseElement.querySelector('img').src
        const curbImg = this.createCurbChoiseImg(curbImgSource)

        const resultHeader = document.createElement('h5')
        resultHeader.textContent = data.result.message

        const resultSubHeader = document.createElement('h6')
        resultSubHeader.textContent = this.prepareResultMessage(data.result.status, data.result.curb_bet)

        this.resultModalTitleTarget.append(resultHeader)
        this.resultModalTitleTarget.append(resultSubHeader)

        this.curbChoiseTarget.prepend(curbImg)
        resultModal.show()
      }
    );

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

  createUserChoiseImg(src) {
    const img = document.createElement('img')
    img.setAttribute("width", "100")
    img.setAttribute("height", "100")
    img.src = src
    return img
  }

  createCurbChoiseImg(src) {
    const img = document.createElement('img')
    img.setAttribute("width", "100")
    img.setAttribute("height", "100")
    img.src = src
    return img
  }

  createResultTitle(element) {
    const title = document.createElement('h5')
    title.classList.add('modal-title')
    title.textContent = element
    return title
  }

  fetchCurbChoise(userChoise) {
    return fetch('/ajax/curb/rps/judge', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        user_bet: userChoise
      })
    })
  }

  prepareResultMessage(status, curbBet) {
    let message;
    if (status === 'win') {
      message = `Curb lose with ${curbBet}!`
    } else if (status === 'lose') {
      message = `Curb win with ${curbBet}!`
    } else {
      message = "It's Tie!"
    }
    return message
  }

  removeResultContent() {
    this.resultModalTarget.querySelector('h5').remove()
    this.resultModalTarget.querySelector('h6').remove()
    this.curbChoiseTarget.querySelector('img').remove()
  }
}
