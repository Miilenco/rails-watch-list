import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["banner"]

  connect() {
    console.log("Hello World!");
  }

  update(event) {
    // the function is listening to any input changes done on the form
    // if the value introduced is a valid URL we wan't to update the banner to show it
    // (improvement: check that the target is the 'image_url' input field, rather than any in the form)
    const inputUrl = event.target.value
    if (URL.canParse(inputUrl)) {
      fetch(inputUrl)
        .then( response => {
          if (response.status === 200) {
            const urlRegex = /url\(.+\)/i;
            this.bannerTarget.style.backgroundImage = this.bannerTarget.style.backgroundImage.replace(urlRegex, `url(${event.target.value})`);
          }
        });
    }
  }
}
