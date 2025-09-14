<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>YuhanGames - 메인</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg: #fff;
      --text: #111;
      --muted: #666;
      --brand: #d72638;
      --line: #ddd;
      --nav-bg: #0d1033; /* 어두운 남색 배경 */
      --nav-text: #fff;   /* 글씨 흰색 */
    }

    * {margin:0; padding:0; box-sizing:border-box;}
    body {font-family: Pretendard, sans-serif; background: var(--bg); color: var(--text);}
    a {text-decoration:none; color:inherit;}

    /* 헤더 스타일 */
    header {
      border-bottom:1px solid var(--line);
      padding:10px 20px;
      display:flex;
      align-items:center;
      justify-content:space-between;
      flex-wrap:wrap;
      background: var(--nav-bg);
    }

    header .logo {font-size:26px; font-weight:800; color: var(--nav-text);}
    nav ul {display:flex; list-style:none; gap:20px; font-size:15px; flex-wrap:wrap;}
    nav ul li a {color: var(--nav-text); font-weight:600;}

    .top-banner {
      text-align:center;
      margin:10px 0;
    }

    /* 탑 배너 이미지 반응형 설정 */
    .top-banner img {
      width: 100%;
      height: 250px;
      object-fit: cover;
      border-radius: 10px;
    }

    .container {display:flex; gap:20px; max-width:1200px; margin:20px auto; padding:0 20px;}
    .main {flex:3;}
    .sidebar {flex:1;}
    .headline {position:relative;}
    .headline img {width:100%; border-radius:10px;}
    .headline .title {position:absolute; bottom:0; left:0; right:0; background:rgba(0,0,0,0.6); color:#fff; padding:12px; font-size:20px;}
    .news-section {margin-top:30px;}
    .news-card {display:flex; gap:12px; padding:30px 0; border-bottom:1px solid var(--line);width: 100%;}
    .news-card:last-child {border-bottom:none;}
    .news-card img {width:120px; height:80px; object-fit:cover; border-radius:6px; flex-shrink:0;}
    .news-card .info {flex:1;}
    .news-card h3 {font-size:16px; margin-bottom:6px;}
    .sidebar .widget {margin-bottom:20px; border:1px solid var(--line); border-radius:10px; padding:12px; background:#fafafa;}
    .widget h4 {font-size:15px; margin-bottom:10px; border-bottom:1px solid var(--line); padding-bottom:6px;}
    .sidebar .widget ul {list-style:none; padding:0; margin:0;}
    .sidebar .widget ul li {margin-bottom:8px; font-size:14px; word-break:break-word; white-space:normal; line-height:1.4;}

    /* 푸터 스타일 */
    footer {
      margin-top:40px;
      padding:20px;
      border-top:1px solid var(--line);
      font-size:13px;
      text-align:center;
      color: var(--nav-text);
      background: var(--nav-bg);
    }

    /* 📱 반응형 스타일 */
    @media (max-width: 768px) {
      .container {flex-direction: column;}
      .news-card {flex-direction: column;}
      .news-card img {width:100%; height:auto;}
      nav ul {gap:10px; font-size:14px;}
      header {flex-direction:column; align-items:flex-start; gap:10px;}
    }
  </style>
</head>
<body>
  <header>
    <div class="logo">GameLike</div>
    <nav>
      <ul>
        <li><a href="#">뉴스</a></li>
        <li><a href="#">리뷰</a></li>
        <li><a href="#">특집</a></li>
        <li><a href="#">모바일</a></li>
        <li><a href="#">웹게임</a></li>
      </ul>
    </nav>
    <div>
      <a href="login.jsp" style="color: var(--nav-text);">로그인</a> | <a href="register.jsp" style="color: var(--nav-text);">회원가입</a>
    </div>
  </header>

  <div class="top-banner">
    <img src="탑배너.jpg" alt="탑 배너" />
  </div>

  <div class="container">
    <main class="main">
      <div class="headline">
        <img src="" alt="메인 뉴스" style="width:50%; height:200%;" />
        <div class="title">'근본'이 온다, 히어로즈 오브 마이트 앤 매직: 올든 에라</div>
      </div>

      <div class="news-section">
        <div class="news-card">
          <img src="광고배너_2.jpg" alt="기사1" />
          <div class="info">
            <h3>9월 4일 사냥이 시작 된다(Hollow_Knight)</h3>
            <p class="meta">신재연 기자 • 2025-09-14</p>
          </div>
        </div>
        <div class="news-card">
          <img src="광고배너.jpg" alt="기사2" />
          <div class="info">
            <h3>현재 매출 상위권 게임</h3>
            <p class="meta">이영 기자 • 2025-09-14</p>
          </div>
        </div>
      </div>
    </main>

    <aside class="sidebar">
      <div class="widget">
        <h4>실시간 인기</h4>
        <ul>
          <li><a href="#">Stardew_Valley</a></li>
          <li><a href="#">PUBG</a></li>
          <li><a href="#">Hollow_Knight_Silksong</a></li>
          <li><a href="#">PEAK</a></li>
        </ul>
      </div>

      <div class="widget">
        <h4>인기광고</h4>
        <img src="PUBG.jpg" alt="인기광고" style="width:100%; border-radius:6px;" />
      </div>
    </aside>
  </div>

  <footer>
    ⓒ 2025 YuhanGames. All rights reserved.
  </footer>
</body>
</html>
