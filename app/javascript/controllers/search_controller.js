import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  connect() {
    let qString = window.location.search;
    let urlParams = new URLSearchParams(qString);
    if (urlParams.has('word')){
      let word = urlParams.get('word');
      if (word != ''){
        console.log(word);
      }
      let field = document.getElementById('word');
      field.value = `${word}`;
    }
  }

  disconnect() {
    let field = document.getElementById('word');
    field.value = ``;
  }
}