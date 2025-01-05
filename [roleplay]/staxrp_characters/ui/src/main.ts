import '@/assets/app.css';

import { createApp } from 'vue'
import { createPinia } from 'pinia'

// Pinia
const pinia = createPinia();

// Vuetify
import 'vuetify/styles';
import { createVuetify } from 'vuetify';
import { aliases, mdi } from 'vuetify/iconsets/mdi-svg';

const vuetify = createVuetify({
  theme: {
    defaultTheme: 'light'
  },
  icons: {
    defaultSet: 'mdi',
    aliases,
    sets: {
      mdi
    }
  }
});

// App
import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(pinia);
app.use(router);
app.use(vuetify);

app.mount('#app')
