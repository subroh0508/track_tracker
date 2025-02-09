import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    toggle() {
        console.log("click!");
        this.menuTarget.classList.toggle('hidden');
    }
}
