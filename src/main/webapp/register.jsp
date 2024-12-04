<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    body {
        background-color: #f8f9fa;
    }
    .form-container {
        max-width: 400px;
        margin: 100px auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .form-container h2 {
        margin-bottom: 30px;
    }
    .form-container .form-label {
        font-weight: bold;
    }
    .form-container .btn-primary {
        width: 100%;
    }
    .error-message {
        color: red;
        font-size: 0.9rem;
        display: none;
    }
  </style>
</head>
<body>

<div class="container form-container">
  <h2 class="text-center">Register</h2>
  <form method="post" action="register" id="registerForm">
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control" id="username" name="username" required>
      <div class="error-message" id="usernameError">Username is required.</div>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" required>
      <div class="error-message" id="emailError">Valid email is required.</div>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
      <div class="error-message" id="passwordError">Password must be at least 6 characters long.</div>
    </div>
    <button type="submit" class="btn btn-primary">Register</button>
  </form>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<!-- JavaScript for Validation -->
<script>
  document.getElementById('registerForm').addEventListener('submit', function (e) {
      e.preventDefault();

      // Clear previous errors
      document.getElementById('usernameError').style.display = 'none';
      document.getElementById('emailError').style.display = 'none';
      document.getElementById('passwordError').style.display = 'none';

      // Get form values
      var username = document.getElementById('username').value;
      var email = document.getElementById('email').value;
      var password = document.getElementById('password').value;

      var isValid = true;

      // Simple validation logic
      if (username === '') {
          document.getElementById('usernameError').style.display = 'block';
          isValid = false;
      }
      if (email === '' || !email.includes('@')) {
          document.getElementById('emailError').style.display = 'block';
          isValid = false;
      }
      if (password.length < 6) {
          document.getElementById('passwordError').style.display = 'block';
          isValid = false;
      }

      if (isValid) {
          alert('Form submitted successfully!');
          // Submit the form data to the backend here (e.g., using fetch or AJAX)
      }
  });
</script>
</body>
</html>

