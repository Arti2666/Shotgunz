
const displayIndex = () => {
  if (document.querySelector(".public")) {

    const btnPub = document.querySelector(".public")
    const btnPriv = document.querySelector(".private")
    const btnShot = document.querySelector(".shotguns")

    const divPub = document.querySelector(".div-public")
    const divPriv = document.querySelector(".div-private")
    const divShot = document.querySelector(".div-my-shot")

    btnPub.addEventListener("click", (event) => {
      divPub.classList.remove("d-none")
      divPriv.classList.add("d-none")
      divShot.classList.add("d-none")
    })
    btnPriv.addEventListener("click", (event) => {
      divPub.classList.add("d-none")
      divPriv.classList.remove("d-none")
      divShot.classList.add("d-none")
    })
    btnShot.addEventListener("click", (event) => {
      divPub.classList.add("d-none")
      divPriv.classList.add("d-none")
      divShot.classList.remove("d-none")
    })
  }

}

export { displayIndex }
