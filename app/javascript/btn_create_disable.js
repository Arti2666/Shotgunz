const btnCreateDisable = () => {
  if (document.querySelector('#btn-create-list')) {
    const btnCreateList = document.querySelector('#btn-create-list')

    const disableFunction = () => {
      btnCreateList.disabled = true;
    }

    btnCreateList.addEventListener("click", (event) => {
      setTimeout(disableFunction, 1);
    })
  }

}

export { btnCreateDisable }
