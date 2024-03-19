class alert {
  alertbox(message) {
    const alertContainer = document.getElementById('alert');

    const alert = document.createElement('div');

    alert.classList.add('alert');

    alert.textContent = message;
    
    alert.style.position = 'fixed';
    alert.style.top = '50%';
    alert.style.left = '50%';
    alert.style.transform = 'translate(-50%, -50%)';
    
    alert.style.backgroundColor = '#fff';
    alert.style.border = '1px solid #ccc';
    alert.style.padding = '1rem';
    alert.style.maxWidth = '80%';
    alert.style.zIndex = '9999';


         
  }
    
}
