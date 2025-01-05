<script setup lang="ts">
import '@/assets/views/SelectCharacter/view.css';
</script>

<template>
    <div class="title">Server Title</div>
    <div class="info">Testing Character Info</div>
    <div class="characters">
        <v-container>
            <div class="d-flex justify-space-around background-color='primary'">
                <v-sheet v-for="n in 3" :key="n" class="ma-2 pa-2">
                    justify-space-around
                </v-sheet>
            </div>
        </v-container>
    </div>
</template>