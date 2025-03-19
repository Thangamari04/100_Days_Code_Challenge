const box = document.getElementById('box');
const output = document.getElementById('output');
const logList = document.getElementById('log-list');

const customCursor = document.createElement('div');
customCursor.classList.add('custom-cursor');
document.body.appendChild(customCursor);

document.addEventListener('mousemove', (event) => {
  customCursor.style.left = `${event.clientX}px`;
  customCursor.style.top = `${event.clientY}px`;
});

function logEvent(event) {
  const logItem = document.createElement('li');
  logItem.textContent = `${event.type} at ${new Date().toLocaleTimeString()}`;
  logList.appendChild(logItem);
  logList.scrollTop = logList.scrollHeight; 
}

box.addEventListener('click', () => {
  output.textContent = 'Single Click!';
  box.style.backgroundColor = '#2ecc71'; 
  logEvent(new Event('click'));
});

box.addEventListener('dblclick', () => {
  output.textContent = 'Double Click!';
  box.style.backgroundColor = '#e67e22'; 
  logEvent(new Event('dblclick'));
});

box.addEventListener('contextmenu', (event) => {
  event.preventDefault(); 
  output.textContent = 'Right Click!';
  box.style.backgroundColor = '#e74c3c'; 
  logEvent(new Event('contextmenu'));
});

box.addEventListener('mouseenter', () => {
  output.textContent = 'Mouse Entered!';
  box.style.backgroundColor = '#9b59b6'; 
  logEvent(new Event('mouseenter'));
});

box.addEventListener('mouseleave', () => {
  output.textContent = 'Mouse Left!';
  box.style.backgroundColor = '#3498db'; 
  logEvent(new Event('mouseleave'));
});

box.addEventListener('mousemove', (event) => {
  const x = event.clientX - box.offsetLeft;
  const y = event.clientY - box.offsetTop;
  output.textContent = `Moving: X: ${x}, Y: ${y}`;
  logEvent(new Event('mousemove'));
});

box.addEventListener('mousedown', () => {
  output.textContent = 'Mouse Down!';
  box.style.backgroundColor = '#34495e'; 
  logEvent(new Event('mousedown'));
});

box.addEventListener('mouseup', () => {
  output.textContent = 'Mouse Up!';
  box.style.backgroundColor = '#1abc9c'; 
  logEvent(new Event('mouseup'));
});