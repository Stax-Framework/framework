<script setup lang="ts">
    import '@/assets/views/SelectCharacter/view.css';
    import { ref } from 'vue'
    var selectedChar = ref('')
</script>

<template>
    <div class="title ma-2 pa-2">display-4</div>
    <div class="info ma-2 pa-2">Testing Character Info</div>
    <div class="characters">
        <div class="d-flex justify-space-around">
            <v-btn-toggle rounded v-model="selectedChar">
                <v-btn v-for="n in 5" :key="n" outline color="primary" class="ma-2 pa-2" :value="'character_' + n">{{ 'Character ' + n }}</v-btn>
            </v-btn-toggle>
        </div>
    </div>
</template>