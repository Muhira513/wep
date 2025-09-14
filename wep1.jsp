<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // 컨트롤러에서 넘겨준 article 객체 받기 (예시용)
    String title = (String) request.getAttribute("title");
    if (title == null) title = "스타듀밸리: 힐링 농장 게임";

    String author = (String) request.getAttribute("author");
    if (author == null) author = "익명";

    String content = (String) request.getAttribute("content");
    if (content == null) content = "스타듀밸리는 농사, 낚시, 채광, 마을 교류, 연애 등 다양한 요소를 즐길 수 있는 힐링형 인디게임입니다.";

    int viewCount = request.getAttribute("viewCount") != null ? (Integer) request.getAttribute("viewCount") : 0000;

    Date date = (Date) request.getAttribute("publishedAt");
    if (date == null) date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
    String publishedAt = sdf.format(date);

    String tags = (String) request.getAttribute("tags");
    if (tags == null) tags = "농사, 힐링, 인디게임";

    String prevArticle = (String) request.getAttribute("prevArticle");
    if (prevArticle == null) prevArticle = "이전기사";

    String nextArticle = (String) request.getAttribute("nextArticle");
    if (nextArticle == null) nextArticle = "다음기사";

    // 댓글 리스트 (DB 대신 예시용)
    List<String> comments = (List<String>) request.getAttribute("comments");
    if (comments == null) {
        comments = new ArrayList<>();
        comments.add("정말 재밌는 게임이에요!");
        comments.add("농사게임 중 최고 👍");
        comments.add("노가다 시뮬레이션");
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title><%= title %> - GameLinks</title>
  <style>
    :root {
      --bg: #ffffff;
      --text: #222222;
      --muted: #666666;
      --border: #e0e0e0;
      --primary: #0056b3;
      --chip-bg: #f1f3f5;
      --chip-text: #333;
    }
    body {
      margin: 0;
      font-family: 'Pretendard', sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.6;
    }
    a { color: var(--primary); text-decoration: none; }
    a:hover { text-decoration: underline; }
    header {
      background: #0d1033;
      border-bottom: 1px solid var(--border);
      padding: 12px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header .logo {
      font-weight: 700;
      font-size: 1.4rem;
      color: #ffffff;
    }
    nav a { margin: 0 10px; color: #ffffff; }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 18px;
      display: flex;
      gap: 20px;
    }
    .main { flex: 3; }
    .sidebar { flex: 1; }
    h1.headline { font-size: 1.8rem; margin: 12px 0; }
    .subhead { font-size: 1.1rem; color: var(--muted); }
    .meta { font-size: 0.9rem; color: var(--muted); margin-bottom: 16px; }
    .hero img { width: 100%; border-radius: 8px; }
    .content { margin: 20px 0; }
    .tags { margin: 10px 0; }
    .chip {
      display: inline-block;
      background: var(--chip-bg);
      color: var(--chip-text);
      font-size: 0.85rem;
      padding: 4px 10px;
      border-radius: 20px;
      margin: 2px 4px 2px 0;
    }
    .nav-articles {
      display: flex;
      justify-content: space-between;
      margin: 20px 0;
    }
    .nav-articles a {
      padding: 6px 12px;
      border: 1px solid var(--border);
      border-radius: 6px;
      background: #fafafa;
    }
    .card {
      border: 1px solid var(--border);
      border-radius: 8px;
      background: #fff;
      padding: 12px;
      margin-bottom: 18px;
    }
    .comments {
      margin-top: 30px;
    }
    .comments h3 { margin-bottom: 10px; }
    .comment-box {
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 10px;
      margin: 8px 0;
      background: #fafafa;
    }
    .comment-form textarea {
      width: 100%;
      height: 60px;
      padding: 8px;
      border-radius: 6px;
      border: 1px solid var(--border);
      resize: none;
    }
    .comment-form button {
      margin-top: 6px;
      padding: 6px 12px;
      background: var(--primary);
      color: #fff;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    .ad {
      margin-bottom: 18px;
      text-align: center;
    }
    footer {
      border-top: 1px solid var(--border);
      background: #0d1033;
      padding: 16px 0;
      margin-top: 40px;
      font-size: 0.9rem;
      color: #ffffff;
      text-align: center;
    }
  </style>
</head>
<body>
  <header>
    <a href="menu.jsp"><span class="logo">GameLinks</span></a>
    <nav>
      <a href="menu.jsp">홈</a>
      <a href="#">뉴스</a>
      <a href="#">리뷰</a>
      <a href="#">가이드</a>
      <a href="#">인터뷰</a>
      <a href="#">e스포츠</a>
      <a href="#">영상</a>
    </nav>
  </header>

  <div class="container">
    <main class="main">
      <h1 class="headline"><%= title %></h1>
      <p class="subhead">by <%= author %></p>
      <div class="meta">
        조회수: <%= viewCount %> · <%= publishedAt %>
      </div>

      <div class="hero">
        <img src="image/Stardew_Valley.jpg" alt="메인 이미지">
      </div>

      <div class="content">
        <p><%= content %></p>
      </div>

      <!-- 해시태그 -->
      <div class="tags">
        <% if (tags != null && !tags.isEmpty()) {
             String[] tagList = tags.split(",");
             for (String t : tagList) { %>
               <span class="chip">#<%= t.trim() %></span>
        <%   }
           } %>
      </div>

      <!-- 이전/다음 기사 -->
      <div class="nav-articles">
        <a href="prev.jsp">&larr; <%= prevArticle %></a>
        <a href="next.jsp"><%= nextArticle %> &rarr;</a>
      </div>

      <!-- 댓글 -->
      <div class="comments">
        <h3>댓글</h3>
        <% for (String c : comments) { %>
          <div class="comment-box"><%= c %></div>
        <% } %>

        <form class="comment-form" method="post" action="addComment.jsp">
          <textarea name="comment" placeholder="댓글을 입력하세요..."></textarea>
          <br>
          <button type="submit">등록</button>
        </form>
      </div>
    </main>

    <aside class="sidebar">
      <!-- 광고 배너 (사이드바 최상단) -->
      <div class="ad">
        <img src="image/광고배너_2.jpg" alt="광고 배너" width="300" height="250">
      </div>

      <div class="card">
        <h3>연관 기사</h3>
        <ul>
          <li><a href="#">PUBG</a></li>
          <li><a href="#">Hollow_Knight_Silksong</a></li>
        </ul>
      </div>

      <div class="card">
        <h3></h3>
        <img src="image/광고배너.jpg" alt="인기 게임" style="width:100%">
      </div>
    </aside>
  </div>

  <footer>
    © YuhanGames | 회사소개 | 문의 | 개인정보처리방침 | 이용약관
  </footer>
</body>
</html>
