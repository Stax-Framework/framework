import { defineStore } from 'pinia'

export const baseStore = defineStore('core', {
    state: () => ({
        visible: false,
    }),
    getters: {
        isVisible: (state) => state.visible
    },
    actions: {
        setVisible(visible) {
            this.visible = visible
        }
    },
})