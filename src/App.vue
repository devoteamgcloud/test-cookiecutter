<template>
  <v-app id="app">
    <NavigationDrawer @expand="adaptMargin($event)" />
    <v-main
      id="main-container"
      class="d-flex"
    >
      <RouterView />
    </v-main>
  </v-app>
  <SnackBar />
</template>

<script setup lang="ts">
import NavigationDrawer from '@/components/NavigationDrawer.vue'
import SnackBar from '@/components/common/SnackBar.vue'

function adaptMargin(event) {
  const mainContainer = document.getElementById('main-container')
  mainContainer.style.marginLeft = event ? '56px' : '230px'
}
</script>

<style scoped>
#main-container {
  padding: var(--navigation-bar-height) 0px var(--navigation-bar-height) 0px;
}
</style>
