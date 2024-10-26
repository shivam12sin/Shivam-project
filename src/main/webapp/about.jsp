<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - QuizMaster</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <style>
    body { background-color:  #f8f9fa; }

    .header-about {
      background-color: #007bff;
      color: white;
      padding:  50px 0;
      text-align:   center;
    }

    .header-about h1 { margin:  0; }

    .section-mission {
      padding:  60px 0 ;
    }

    .section-team {
      background-color:  #f5f7fa;
      padding: 60px  0;
    }

    .card-team {
      box-shadow: 0  4px 8px rgba(0, 0, 0, 0.1);
      border:  none;
      margin-bottom: 30px;
      padding:  30px;
      background-color: white;
    }

    .footer-main {
      background-color: #007bff;
      color: white;
      padding: 20px 0;
      text-align:   center;
    }
  </style>
</head>
<body>

<!-- About Header -->
<header class="header-about">
  <div class="container">
    <h1>About QuizMaster</h1>
    <p>Your one-stop destination for challenging and fun quizzes!</p>
  </div>
</header>

<!-- Mission Section -->
<section class="section-mission">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8 text-center">
        <h2>Our Mission</h2>
        <p>At QuizMaster, our mission is to make learning fun and engaging through interactive quizzes on a wide variety of topics. Whether you're preparing for exams, testing your knowledge, or just having fun, we've got something for everyone!</p>
      </div>
    </div>
  </div>
</section>

<!-- Team Section -->
<section class="section-team">
  <div class="container">
    <h2 class="text-center mb-5">Meet Our Team</h2>
    <div class="row justify-content-center">

      <!-- Team Member 1 -->
      <div class="col-md-4">
        <div class="card-team text-center">
          <img src="team1.jpg" alt="Shivam Singh" class="rounded-circle mb-3" width="120">
          <h5>Shivam Singh</h5>
          <p>Founder & Lead Developer</p>
          <p>Shivam is passionate about creating innovative learning tools and leads our development team with his extensive experience in web development.</p>
        </div>
      </div>

      <!-- Team Member 2 -->
      <div class="col-md-4">
        <div class="card-team text-center">
          <img src="team2.jpg" alt="Sumit Shahi" class="rounded-circle mb-3" width="120">
          <h5>Sumit Shahi</h5>
          <p>Content Strategist</p>
          <p>Sumit ensures that our quizzes cover a wide range of topics and are both educational and fun. He brings a background in education and content creation.</p>
        </div>
      </div>

      <!-- Team Member 3 -->
      <div class="col-md-4">
        <div class="card-team text-center">
          <img src="team3.jpg" alt="Mohd Zainul" class="rounded-circle mb-3" width="120">
          <h5>Mohd Zainul</h5>
          <p>UI/UX Designer</p>
          <p>Mohd designs user-friendly interfaces to make sure your experience on QuizMaster is as seamless and enjoyable as possible.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer-main">
  <div class="container">
    <p>&copy; 2024 QuizMaster. All rights reserved.</p>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


