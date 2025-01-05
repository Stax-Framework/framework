import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'select',
      component: () => import("../views/SelectCharacter.vue")
    },
    {
      path: '/create',
      name: 'create',
      component: () => import("../views/CreateCharacter.vue")
    }
  ]
})

export default router
