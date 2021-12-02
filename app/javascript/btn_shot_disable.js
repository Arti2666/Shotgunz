const btnShotDisable = () => {
  if (document.querySelector("#btn-shotgun-show")) {
    const btnShotgunShow = document.querySelector('#btn-shotgun-show')
    console.log("disable shotgun connecté")

    const disableFunction = () => {
      btnShotgunShow.disabled = true;
    }

    btnShotgunShow.addEventListener("click", (event) => {
      setTimeout(disableFunction, 1);
    })
  }

}

export { btnShotDisable }
