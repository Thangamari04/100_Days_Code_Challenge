/* sidenav.js */
function toggleNav() {
    const nav = document.getElementById('sidenav');
    if (nav.style.width === '200px') {
      nav.style.width = '0';
    } else {
      nav.style.width = '200px';
    }
  }
  