import { ref } from 'vue';
import { defineStore } from 'pinia';
import router from "@/router/index";

export const useRouterStore = defineStore('router', () => {
  const show = ref(false);
  const route = ref("/");

  function SET_SHOW_STATE(state: boolean) {
    show.value = state;
  }

  function GET_ROUTE(): string {
    return route.value;
  }

  function SET_ROUTE(newRoute: string): void {
    if (router.hasRoute(newRoute)) {
      route.value = newRoute;
      router.push(newRoute);
    }
  }

  return {
    // States
    show,

    // Methods
    SET_SHOW_STATE,
    GET_ROUTE,
    SET_ROUTE
  }
})