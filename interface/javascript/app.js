const { createApp } = Vue;

createApp({
  data() {
    return { 
      action: 'closeUI',
      closet: []

    };
  },
  methods: {
    getData() {
      window.addEventListener("message", (event) => {
        if (event.data) {
          this.action = event.data.action;
          this.closet = event.data.closet;
        }
      });
    },
    onkeydown (){
      window.addEventListener("keydown", (event) => {
        if (event.key == 'Escape') {
          this.CloseUI()
        }
      });
    },
    CloseUI(){
      fetch(`https://${GetParentResourceName()}/CloseUI`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({}),
    });
    },
    async clothingUse(clothing){
      await fetch(`https://${GetParentResourceName()}/clothingUse`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({clothing}),
      });
    }
  },
  async mounted() {
    await this.getData();
    await this.onkeydown();
  }
}).mount("#app");
